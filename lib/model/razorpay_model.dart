import 'dart:convert';

RazorpayModel razorpayModelFromJson(String str) => RazorpayModel.fromJson(json.decode(str));

String razorpayModelToJson(RazorpayModel data) => json.encode(data.toJson());

class RazorpayModel {
    RazorpayModel({
        required this.response,
        required this.codSuccess,
    });

    Response response;
    bool codSuccess;

    factory RazorpayModel.fromJson(Map<String, dynamic> json) => RazorpayModel(
        response: Response.fromJson(json["response"]),
        codSuccess: json["codSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "codSuccess": codSuccess,
    };
}

class Response {
    Response({
        required this.id,
        required this.entity,
        required this.amount,
        required this.amountPaid,
        required this.amountDue,
        required this.currency,
        required this.receipt,
        required this.offerId,
        required this.status,
        required this.attempts,
        required this.notes,
        required this.createdAt,
    });

    String id;
    String entity;
    int amount;
    int amountPaid;
    int amountDue;
    String currency;
    String receipt;
    dynamic offerId;
    String status;
    int attempts;
    List<dynamic> notes;
    int createdAt;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        entity: json["entity"],
        amount: json["amount"],
        amountPaid: json["amount_paid"],
        amountDue: json["amount_due"],
        currency: json["currency"],
        receipt: json["receipt"],
        offerId: json["offer_id"],
        status: json["status"],
        attempts: json["attempts"],
        notes: List<dynamic>.from(json["notes"].map((x) => x)),
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity,
        "amount": amount,
        "amount_paid": amountPaid,
        "amount_due": amountDue,
        "currency": currency,
        "receipt": receipt,
        "offer_id": offerId,
        "status": status,
        "attempts": attempts,
        "notes": List<dynamic>.from(notes.map((x) => x)),
        "created_at": createdAt,
    };
}
