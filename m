Return-Path: virtio-comment-return-689-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E423A985E59
	for <virtio-comment@lists.oasis-open.org>; Tue,  5 Mar 2019 16:16:05 +0000 (UTC)
From: "Savir, Gil" <gil.savir@intel.com>
Date: Tue, 5 Mar 2019 16:15:00 +0000
Message-ID: <54DB94AE64EDA14BAB6A1E9641A26B011AC7DEA3@hasmsx109.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Duplicated text - Section 5.2.6.4 - version 1.1 draft 01
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

In version 1.1 draft 01 - Section 5.2.6.4 - second bullet:

Duplicated text "errors, data_len, sense_len and residual MUST reside in a =
single, separate device-writable descriptor" appears both in the beginning =
and at the end of the 2nd sentence.

The original text:
* For SCSI commands there are additional constraints. errors, data_len, sen=
se_len and residual MUST reside in a single, separate device-writable descr=
iptor, sense MUST reside in a single separate devicewritable descriptor of =
size 96 bytes, and errors, data_len, sense_len and residual MUST reside a s=
ingle separate device-writable descriptor.

I suggest to delete the 1st one, so in the end result, fields are described=
 in same order as appear in struct virtio_scsi_pc_req.

Thanks,
Gil Savir


---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

