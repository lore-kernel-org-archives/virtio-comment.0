Return-Path: <virtio-comment-return-8342-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F94C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 08:18:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 31A292B137
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 08:18:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C2DA98680B
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 08:18:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 01C8B986675; Mon, 13 Nov 2023 08:18:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4C4E9866C5
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 08:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
From: "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] virtio sound: add missing definitions for 12
 and 24kHz sampling rates
Thread-Index: AdoTIVOBs7OOlfs8QAyhGScofwk1EACR3jWAACaXkaA=
Date: Mon, 13 Nov 2023 08:18:18 +0000
Message-ID: <8da912ceb58e48519ff0fc82980b7b60@de.adit-jv.com>
References: <329f386ba6214fb4a58e93a771474d2d@de.adit-jv.com>
 <40kj9.b1c40ocbzv0u@linaro.org>
In-Reply-To: <40kj9.b1c40ocbzv0u@linaro.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.72.94.135]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: RE: [virtio-comment] virtio sound: add missing definitions for 12 and
 24kHz sampling rates

SGVsbG8gTWFub3MsDQoNCnRoYW5rcyBmb3IgcmVwbHkuLg0KDQpUYWJsZSA1NiBpbiBIREEgc3Bl
YyBpbmRlZWQgbGFja3Mgb2YgbWVudGlvbmluZyAxMiBhbmQgMjRrSHoNCg0KQnV0IHJlZmVycmlu
ZyB0byB0aGUgcHJvdG9jb2wgaXRzZWxmICgzLjMuNDE6IFN0cmVhbSBEZXNjcmlwdG9yIGZvcm1h
dCkgMjRrSHogaXMgbWVudGlvbmVkIHRoZXJlLg0KQm90aCByYXRlcyBhcmUgZml0dGluZyBpbnRv
IHRoZSAnc3VibXVsdGlwbGUgc2NoZW1lJy4NCg0KMy4zLjQxOiBTdHJlYW0gRGVzY3JpcHRvciBm
b3JtYXQNClNhbXBsZSBCYXNlIFJhdGUgRGl2aXNvciAoRElWKToNCjAwMCA9IERpdmlkZSBieSAx
ICg0OCBrSHosIDQ0LjEga0h6KQ0KMDAxID0gRGl2aWRlIGJ5IDIgKDI0IGtIeiwgMjIuMDUga0h6
KQ0KMDEwID0gRGl2aWRlIGJ5IDMgKDE2IGtIeiwgMzIga0h6KQ0KMDExID0gRGl2aWRlIGJ5IDQg
KDExLjAyNSBrSHopDQoxMDAgPSBEaXZpZGUgYnkgNSAoOS42IGtIeikNCjEwMSA9IERpdmlkZSBi
eSA2ICg4IGtIeikNCjExMCA9IERpdmlkZSBieSA3DQoxMTEgPSBEaXZpZGUgYnkgOCAoNiBrSHoN
Cg0KMTJrSHogaXMgbm90IG1lbnRpb25lZCB0aGVyZSwgYXNzdW1lIGp1c3QgZHVlIHRvIGJlaW5n
IGEgcmVhbCB1bmNvbW1vbiByYXRlLg0KTG9va2luZyBhdCB0aGUgTGludXggSERBIGRyaXZlciwg
aXQgc2VlbXMgdG8gZS5nLiBhbGxvdyB0aGUgOTYwMEh6IGZyb20gdGFibGUgMy4zLjQxIGV2ZW4g
aWYgYWxzbyBub3QgbWVudGlvbmVkIGluIHRoZSAnZGVmaW5lZCBzYW1wbGUgcmF0ZXMnLg0KaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNi4xL3NvdXJjZS9zb3VuZC9oZGEvaGRh
Y19kZXZpY2UuYyNMNzIzDQpJIGFtIGRlZmluaXRlbHkgbm90IGRlZXAgaW5zaWRlIHRoZSBIREEg
c3BlYywgdGh1cyBJIG1heSBiZSB3cm9uZy4uDQoNCk15IGlkZWEgaXMgdG8ganVzdCBhZGQgdGhl
IGRlZmluaXRpb25zIGZvciB0aGVzZSBzYW1wbGluZyByYXRlcyB0byB2aXJ0aW8gc3BlYyAtIGlm
IGEgdmlydGlvIHNvdW5kIGRldmljZSBkb2VzIG5vdCBzdXBwb3J0IHRoZXNlIGl0IG11c3Qgbm90
IGV4cG9zZSB0aGVzZSByYXRlLWJpdHMuDQpBdCBsZWFzdCBmb3IgMjRrSHogSSBzZWUgbm8gaW5j
b21wYXRpYmlsaXR5IHRvIEhEQSBzcGVjIGR1ZSBhdCBsZWFzdCBleHBsaWNpdCBwcmVzZW5jZSBp
biB0aGUgc3RyZWFtIGRlc2NyaXB0b3Igc3BlYy4gDQoNCg0KDQpSZWdhcmRzLA0KQW5kcmVhcw0K
DQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hbm9zIFBpdHNpZGlhbmFr
aXMgPG1hbm9zLnBpdHNpZGlhbmFraXNAbGluYXJvLm9yZz4gDQpTZW50OiBTb25udGFnLCAxMi4g
Tm92ZW1iZXIgMjAyMyAxNTowNQ0KVG86IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4u
b3JnOyBQYXBlLCBBbmRyZWFzIChBRElURy9FU1MzKSA8YXBhcGVAZGUuYWRpdC1qdi5jb20+DQpT
dWJqZWN0OiBSZTogW3ZpcnRpby1jb21tZW50XSB2aXJ0aW8gc291bmQ6IGFkZCBtaXNzaW5nIGRl
ZmluaXRpb25zIGZvciAxMiBhbmQgMjRrSHogc2FtcGxpbmcgcmF0ZXMNCg0KSGVsbG8gQW5kcmVh
cywNCg0KVGhlIHNwZWMgc2F5cyBpdCBpcyBwdXJwb3NlbHkgbW9kZWxlZCB0byBiZSBjb21wYXRp
YmxlIHdpdGggdGhlIEhEQSBzcGVjLiBIREEgaXMgb3B0aW1pemVkIGZvciBzcGVjaWZpYyBtdWx0
aXBsZXMgb3Igc3VibXVsdGlwbGVzIG9mIDQ0LjEga0h6IGFuZCA0OCBrSHouIFNwZWNpZmljYWxs
eSwgbG9vayBhdCAiNS40IEhhbmRsaW5nIFN0cmVhbSBJbmRlcGVuZGVudCBTYW1wbGUgUmF0ZXMi
IGFuZCAiVGFibGUgNTYuIERlZmluZWQgU2FtcGxlIFJhdGVzIi4gTXkgKHVuZXhwZXJpZW5jZWQp
IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGZvbGxvd2luZyBzdGF0ZW1lbnQgaXMgdGhhdCB1c2luZyBz
dWNoIHJhdGVzIHdpdGggY29udHJvbGxlciBoYXJkd2FyZSB0aGF0IGlzIG1hZGUgZm9yIEhEQSB3
aWxsIHJlc3VsdCBpbiB0aW1pbmcgaXNzdWVzOg0KDQo+IFRoaXMgaW1wbGllcyB0aGF0IHRoZSBj
b250cm9sbGVyIGFuZCBsaW5rIG11c3QgYWxzbyBwcm92aWRlIGZvciBhbiANCj4gZXhhY3Qgc2Ft
cGxlLXJlbmRlcmluZyByYXRlIGF0IHRoZSBjb2RlYywgaW4gb3JkZXIgdG8gYXZvaWQgYW55IGxv
bmcgDQo+IHRlcm0gZHJpZnQgYmV0d2VlbiBzYW1wbGUgZGVsaXZlcnkgYW5kIHJlbmRlcmluZyBh
bmQgdGhlIHN1YnNlcXVlbnQgDQo+IG92ZXIodW5kZXIpLXJ1biBvZiBjb2RlYyBidWZmZXJzLg0K
DQpodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX3d3
dy5pbnRlbC5jb21fY29udGVudF9kYW1fd3d3X3B1YmxpY191c19lbl9kb2N1bWVudHNfcHJvZHVj
dC0yRHNwZWNpZmljYXRpb25zX2hpZ2gtMkRkZWZpbml0aW9uLTJEYXVkaW8tMkRzcGVjaWZpY2F0
aW9uLnBkZiZkPUR3SURhUSZjPWV1R1pzdGNhVERsbHZpbUVOOGI3alhyd3FPZi12NUFfQ2RwZ25W
ZmlpTU0mcj1hV1R0b2pNdENWOVN2eUV3a3BCTnVUalZuek1tLVdjMDlPTktEbVZlQ1VvJm09Q3RC
dWJ2LXpfVUx1NnhaVno1U0NRTHEyWXE1SzJCSnhEU0xmUzJXT0tGQ2habVZRdlJZOXNBY2VfRXR3
RjRwTyZzPTcxRWlYLXNUYzlMUVZCTnhpeXQ2VkxiMWVKQnhmNTRIV09GUDNpaE9QdGsmZT0NCg0K
SWYgdGhhdCBpcyB0aGUgY2FzZSwgSSB0aGluayB0aGUgYmVzdCBhcHByb2FjaCB3b3VsZCBiZSB0
byBzcGVjaWZ5IGEgbm9uLUhEQSBtb2RlIG9mIG9wZXJhdGlvbiB0byBzdXBwb3J0IG1vcmUgc291
bmQgaGFyZHdhcmUuIFRoZSBtb3N0IHN0cmFpZ2h0LWZvcndhcmQgc29sdXRpb24gdGhvdWdoIGlz
IGZvciB5b3UgdG8gcmVzYW1wbGUgdGhlIGF1ZGlvIGJlZm9yZSBhbmQgYWZ0ZXIgaXQgZ29lcyB0
aHJvdWdoIHZpcnRpby1zb3VuZC4NCg0KDQpSZWdhcmRzLA0KDQotLSBNYW5vcyBQaXRzaWRpYW5h
a2lzDQpFbXVsYXRpb24gYW5kIFZpcnR1YWxpemF0aW9uIEVuZ2luZWVyIGF0IExpbmFybyBMdGQN
Cg==

