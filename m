Return-Path: virtio-comment-return-1008-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39D75985DF6
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jan 2020 11:45:12 +0000 (UTC)
From: Damir Shaikhutdinov <Damir.Shaikhutdinov@opensynergy.com>
Date: Mon, 20 Jan 2020 11:45:05 +0000
Message-ID: <21D64D2457144C4AA23D071E2F6A51EC01592F5BFC@MXS01.open-synergy.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] Block Device VIRTIO_BLK_F_RO clarification needed.
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hello!

While reading section 5.2 of the spec, I found that VIRTIO_BLK_F_RO feature=
 could use
some additional clarification regarding handling requests when it was offer=
ed.

This RO feature is described as "Device is read only" (Section 5.2.3). Ther=
e are some explicit requirements for this feature, but they only describe a=
 "write request".

5.2.5 p3 says "If the VIRTIO_BLK_F_RO feature is set by the device, any wri=
te requests will fail."

5.2.6 says "The type of the request is either a read (VIRTIO_BLK_T_IN), a w=
rite (VIRTIO_BLK_T_OUT) ...", so "write request" mentioned in 5.2.5 p3 is V=
IRTIO_BLK_T_OUT.

5.2.6.2 says "A device MUST set the status byte to VIRTIO_BLK_S_IOERR for a=
 write request if the VIRTIO_BLK_F_RO
feature if offered, and MUST NOT write any data."

What is missing here is a requirement for features and other types of reque=
sts in case of VIRTIO_BLK_F_RO:

* config.writeback field (guarded by VIRTIO_BLK_F_CONFIG_WCE feature)
* VIRTIO_BLK_T_ FLUSH (guarded by VIRTIO_BLK_F_FLUSH feature)
* VIRTIO_BLK_T_DISCARD (guarded by VIRTIO_BLK_F_DISCARD feature)
* VIRTIO_BLK_T_WRITE_ZEROES (guarded by VIRTIO_BLK_F_WRITE_ZEROES feature)

Configuration field, requests and features described above make no sense in=
 presence of VIRTIO_BLK_F_RO.

This can be clarified in several ways, for example:

1. Device should not offer CONFIG_WCE, FLUSH, DISCARD and WRITE_ZEROES feat=
ures if it offers RO feature (partially contradicts 5.2.5.2 "Device SHOULD =
always offer VIRTIO_BLK_F_FLUSH")
2. Device must set the status byte to IOERR for FLUSH, DISCARD and WRITE_ZE=
ROES requests if it offers RO feature.


What do you think about that?

With best regards,
Damir Shaikhutdinov

Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

