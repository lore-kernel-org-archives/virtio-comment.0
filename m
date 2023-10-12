Return-Path: <virtio-comment-return-7698-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AD2CDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 16:41:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BCBC17BAED
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 16:41:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9201898683C
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 16:41:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7903B986818; Thu, 12 Oct 2023 16:41:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A96B986828
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 16:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128886; x=1697733686;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJCEPnjr92G2FTdzPKqzYWfLO2l3jKirWtVEbhOKmMw=;
        b=YueIhg18rgR/RUnFNFNs2CU0ph3MzhM/PNXw94AfXfxd0W3UOYj3S5HXDeynepPm+w
         eJACgE1k4W8css2rW0Qq/pN+81ggTQ2FJpQ6ZWL+fG67BHxK4MyM7aBDgpaPhQMVPF/y
         jsDtN60yBVDxkXvbflZf5T3TYCKqVZcdpUf/kpo9QFBqxZD8sXB6b/HNCbhbJ2aI33hs
         u3OgjRV0/LmOOiykZ2oFpFxOIa/jtZTLF+EntN36WlftDOInwghVQBHcrnLKIXmw4YiE
         hcZwziHK6ujbbnFIqEvi/ypbfq5gH23T7PVjLogvVJoFywhtOXxP5zpCvei37LcC1uBf
         I2Ww==
X-Gm-Message-State: AOJu0YyQMf53x7E6VmpI6MoLfkEtaqs8okZHsjRGBDkHFAnuBouGKvrJ
	PyZVZnE7dXO9eRFHCAcJIxFHHIiwDO9OE7rM5TyPXP7zCtOuuV3gyYE=
X-Google-Smtp-Source: AGHT+IH/Gi4b8kJac3Soc/akZG0jnEslwpgQEqyLNV2ft35CLngiIvDEItMZv0Ot9yV1TLhHX2VYmfyZIwvkxlIJFPw=
X-Received: by 2002:a9d:7d8a:0:b0:6bc:65ad:1b08 with SMTP id
 j10-20020a9d7d8a000000b006bc65ad1b08mr23888343otn.28.1697128885904; Thu, 12
 Oct 2023 09:41:25 -0700 (PDT)
MIME-Version: 1.0
From: Jasper Haag <jasper@bedrocksystems.com>
Date: Thu, 12 Oct 2023 12:41:15 -0400
Message-ID: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: Awais Masood <awais@bedrocksystems.com>, Gordon Stewart <gordon@bedrocksystems.com>
Content-Type: multipart/alternative; boundary="0000000000006203de0607879c1a"
Subject: [virtio-comment] [virtio-queue] CLARIFICATION: "free descriptors" External

--0000000000006203de0607879c1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To whom it may concern,

BedRock Systems is working to formally model VIRTIO Queues and formally
verify our implementation of VIRTIO Queues <
https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base>. One
question which we've been unable to answer solely using the Standard text
relates to "free descriptors" - as referred to within "2.7.13 - Supplying
Buffers to The Device" <
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html=
#x1-6400013>.
In particular, the text states:

| 2.7.13 - Supplying Buffers to The Device
| The driver offers buffers to one of the device=E2=80=99s virtqueues as fo=
llows:
|     1. The driver places the buffer into free descriptor(s) in the
descriptor table, chaining as necessary (see 2.7.5 The Virtqueue Descriptor
Table).
|      .....
|
| 2.7.13.1 - Placing Buffers Into The Descriptor Table
| A buffer consists of zero or more device-readable physically-contiguous
elements followed by zero or more physically-contiguous device-writable
elements (each has at least one element).
| This algorithm maps it into the descriptor table to form a descriptor
chain:
| for each buffer element, b:
|     1. Get the next free descriptor table entry, d
|     2. Set d.addr to the physical address of the start of b
|     3. Set d.len to the length of b.
|     4. If b is device-writable, set d.flags to VIRTQ_DESC_F_WRITE,
otherwise 0.
|     5. If there is a buffer element after this:
|         a. Set d.next to the index of the next free descriptor element.
|         b. Set the VIRTQ_DESC_F_NEXT bit in d.flags.
| In practice, d.next is usually used to chain free descriptors, and a
separate count kept to check there are enough free descriptors before
beginning the mappings.

However, the term "free descriptor" doesn't appear to be defined anywhere
within the Standard text. What characterizes such a "free descriptor", and
does the use of the term "free descriptor" imply that the Driver MUST NOT <
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html=
#x1-50003>
use the same descriptor within multiple chains?

I look forward to hearing your clarification.

Regards,
Jasper Haag

--0000000000006203de0607879c1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span><=
div>To whom it may concern,</div><div><br></div></span><div>BedRock Systems=
 is working to formally model VIRTIO Queues and formally verify our impleme=
ntation of VIRTIO Queues &lt;<a href=3D"https://github.com/bedrocksystems/v=
ml/tree/main/devices/virtio_base" target=3D"_blank">https://github.com/bedr=
ocksystems/vml/tree/main/devices/virtio_base</a>&gt;.
 One question which we&#39;ve been unable to answer solely using the=20
Standard text relates to &quot;free descriptors&quot; - as referred to with=
in &quot;2.7.13 - Supplying Buffers to The Device&quot; &lt;<a href=3D"http=
s://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-=
6400013" target=3D"_blank">https://docs.oasis-open.org/virtio/virtio/v1.2/c=
sd01/virtio-v1.2-csd01.html#x1-6400013</a>&gt;. In particular, the text sta=
tes:</div><span><div><br></div><div>| 2.7.13 - Supplying Buffers to The Dev=
ice</div><div>| The driver offers buffers to one of the device=E2=80=99s vi=
rtqueues as follows:</div></span><div>|=C2=A0=C2=A0=C2=A0=C2=A0 1. The driv=
er places the buffer into free descriptor(s) in the descriptor table,
     chaining as necessary (see 2.7.5=C2=A0The Virtqueue Descriptor Table).=
</div><div>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .....<br>|<br></div><div>| 2.7.1=
3.1 - Placing Buffers Into The Descriptor Table</div><span><div>| A buffer =
consists of zero or more device-readable physically-contiguous elements
followed by zero or more physically-contiguous device-writable elements (ea=
ch has at
least one element).</div><div>| This algorithm maps it into the descriptor =
table to form a
descriptor chain:
<br></div><div>| for each buffer element, b:</div></span><div>|=C2=A0=C2=A0=
=C2=A0=C2=A0 1. Get the next free descriptor table entry, d <br></div><div>=
|=C2=A0=C2=A0=C2=A0=C2=A0 2. Set d.addr to the physical address of the star=
t of b <br></div><div>|=C2=A0=C2=A0=C2=A0=C2=A0 3. Set d.len to the length =
of b. <br></div><div>|=C2=A0=C2=A0=C2=A0=C2=A0 4. If b is device-writable, =
set d.flags to VIRTQ_DESC_F_WRITE, otherwise 0. <br></div><div>|=C2=A0=C2=
=A0=C2=A0=C2=A0 5. If there is a buffer element after this: <br></div><div>=
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a. Set d.next to the inde=
x of the next free descriptor element. <br></div><div>|=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b. Set the VIRTQ_DESC_F_NEXT bit in <span>d.=
flags</span>.</div><span><div>|
 In practice, d.next is usually used to chain free descriptors, and a=20
separate count kept to check there are enough free descriptors before=20
beginning the mappings. </div><br></span><div>However,
 the term &quot;free descriptor&quot; doesn&#39;t appear to be defined anyw=
here within
 the Standard text. What characterizes such a &quot;free descriptor&quot;, =
and=20
does the use of the term &quot;free descriptor&quot; imply that the Driver =
MUST NOT &lt;<a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd0=
1/virtio-v1.2-csd01.html#x1-50003" target=3D"_blank">https://docs.oasis-ope=
n.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-50003</a>&gt; use =
the same descriptor within multiple chains?</div><span><div><br></div><div>=
I look forward to hearing your clarification.</div><div><br></div><div>Rega=
rds,</div><div>Jasper Haag</div></span></div></div></div></div>

--0000000000006203de0607879c1a--
