Return-Path: virtio-comment-return-1314-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E09998611F
	for <virtio-comment@lists.oasis-open.org>; Fri, 12 Jun 2020 15:40:57 +0000 (UTC)
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 12 Jun 2020 16:40:53 +0100
Message-ID: <87sgf0nvga.fsf@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] Clarifying the language of VIRTIO_RPMB_REQ_PROGRAM_KEY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Yang Huang <yang.huang@intel.com>, Bing Zhu <bing.zhu@intel.com>, Tomas Winkler <tomas.winkler@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>


Hi,

In the virtio-rpmb part of the spec it says:

  The operation of a virtio RPMB device is driven by the requests placed on=
 the virtqueue.
    The type of request can be program key (VIRTIO_RPMB_REQ_PROGRAM_KEY),
    get write counter (VIRTIO_RPMB_REQ_GET_WRITE_COUNTER),
    write (VIRTIO_RPMB_REQ_DATA_WRITE), and read (VIRTIO_RPMB_REQ_DATA_READ=
).
    A program key or write request can also combine with a
    result read (VIRTIO_RPMB_REQ_RESULT_READ) for a returned result.

but later on:

  VIRTIO_RPMB_REQ_RESULT_READ
     requests for a returned result. It is used following with VIRTIO_RPMB_=
REQ_PROGRAM_KEY or VIRTIO_RPMB_REQ_DATA_WRITE request types for a returned =
result in one or multiple RPMB frames. If it=E2=80=99s not requested, the d=
evice will not return result frame to the driver.

So which is it? I can't quite see how a VIRTIO_RPMB_REQ_RESULT_READ can
be combined with the other requests because they are not overlapping
bits so maybe the working should be:

  A program key or write request can be followed by a result read (VIRTIO_R=
PMB_REQ_RESULT_READ) for a returned result.

Is that is what is intended?

--=20
Alex Benn=C3=A9e

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

