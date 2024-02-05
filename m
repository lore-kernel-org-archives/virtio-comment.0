Return-Path: <virtio-comment-return-9068-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1AEC4828D
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 14:41:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D44297A2EE
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 14:41:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF7C59865C1
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 14:41:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 947D39864A5; Mon,  5 Feb 2024 14:41:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8488D9864B9;
	Mon,  5 Feb 2024 14:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
From: "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "virtio-dev@lists.oasis-open.org"
	<virtio-dev@lists.oasis-open.org>
Thread-Topic: [PATCH] sound: add sampling rates 12000Hz and 24000Hz
Thread-Index: AdpYHO/hOzVjIa/BRja4ti9bSsr2dwAJCwKw
Date: Mon, 5 Feb 2024 14:41:00 +0000
Message-ID: <10d461c112924dce8f29215359889b7b@de.adit-jv.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.72.94.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] sound: add sampling rates 12000Hz and 24000Hz

MjRrSHogaXMgdXNlZCBmb3IgJ3N1cGVyIHdpZGViYW5kJyB2b2ljZSB0cmFuc21pc3Npb24gMTJr
SHogaXMgYWRkZWQgJ2ZvciBjb21wbGV0ZW5lc3MnDQpGaXhlczogaHR0cHM6Ly9naXRodWIuY29t
L29hc2lzLXRjcy92aXJ0aW8tc3BlYy9pc3N1ZXMvMTg0DQoNClNpZ25lZC1vZmYtYnk6IEFuZHJl
YXMgUGFwZSA8YXBhcGVAZGUuYWRpdC1qdi5jb20+DQotLS0NCiBkZXZpY2UtdHlwZXMvc291bmQv
ZGVzY3JpcHRpb24udGV4IHwgNCArKystDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZGV2aWNlLXR5cGVzL3NvdW5kL2Rlc2Ny
aXB0aW9uLnRleCBiL2RldmljZS10eXBlcy9zb3VuZC9kZXNjcmlwdGlvbi50ZXgNCmluZGV4IDU0
YzljOGUuLmJhZDQ0MTUgMTAwNjQ0DQotLS0gYS9kZXZpY2UtdHlwZXMvc291bmQvZGVzY3JpcHRp
b24udGV4DQorKysgYi9kZXZpY2UtdHlwZXMvc291bmQvZGVzY3JpcHRpb24udGV4DQpAQCAtNTA0
LDcgKzUwNCw5IEBAIFxzdWJzdWJzZWN0aW9ue1BDTSBDb250cm9sIE1lc3NhZ2VzfVxsYWJlbHtz
ZWM6RGV2aWNlIFR5cGVzIC8gU291bmQgRGV2aWNlIC8gRGV2DQogICAgIFZJUlRJT19TTkRfUENN
X1JBVEVfOTYwMDAsDQogICAgIFZJUlRJT19TTkRfUENNX1JBVEVfMTc2NDAwLA0KICAgICBWSVJU
SU9fU05EX1BDTV9SQVRFXzE5MjAwMCwNCi0gICAgVklSVElPX1NORF9QQ01fUkFURV8zODQwMDAN
CisgICAgVklSVElPX1NORF9QQ01fUkFURV8zODQwMDAsDQorICAgIFZJUlRJT19TTkRfUENNX1JB
VEVfMTIwMDAsDQorICAgIFZJUlRJT19TTkRfUENNX1JBVEVfMjQwMDANCiB9Ow0KIA0KIHN0cnVj
dCB2aXJ0aW9fc25kX3BjbV9pbmZvIHsNCi0tDQoyLjcuNA0K

