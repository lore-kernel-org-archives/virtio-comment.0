Return-Path: <virtio-comment-return-7870-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E72ECDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 18:41:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BDD7C157EEB
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 18:41:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A12B2986906
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 18:41:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8DE3B986900; Thu, 19 Oct 2023 18:41:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EE0C986901
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697740910; x=1698345710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1gK3a85BgqK7uqKf6yN8natqAeQoiGnl+vlXVXvoq4=;
        b=TIbnaRSxQTSGVtLd3QGfMTY+NU3YJc+jsm0GNCDzASFn4FiS9Qzdr5deynEeXHyj9l
         YfZPZuZXo0NdR5FuqZrkbZ3vNeJAHVPShcMhbSwMjJ4e7RoZ/nyDbGX91hITs0+9q/5o
         dwOcNGgMu5z7jkq3+mcEMkWGAVdwS7xfqbNhKTBZvqVkRsu3vUJrRoeOq2kni5SOyOym
         +s+p//Q1LHhFzxHQllU3yELR6ZPAi1XPhmMU1ZC2pDUwAJ9dLHuXGEIY+pFtsHIYl/lL
         TftgovEVj55p7i5oyAU1phdH8bSRpURjzvn9UhRTiYZyobGAnBB5l0BGK237rbW45tGz
         za4w==
X-Gm-Message-State: AOJu0YzSKw1No2n1vNG5DEKXBxkE9Uh6f5KW0aBFqd/Se2ESeEiFi1Wz
	KnBFiNVAIZhfPhagni2kAAN+MwSVevpfG+opegYfuavhFEag5THKDns=
X-Google-Smtp-Source: AGHT+IGgQsDFoekwBsDXehFRmgDsDFATh/2z5e1imRXRJ66sN1GxPnYdg8pr0muz5jx0vdzJywCinqUErSCpD1jgPhI=
X-Received: by 2002:a05:6830:3443:b0:6bc:fab5:e996 with SMTP id
 b3-20020a056830344300b006bcfab5e996mr2928866otu.31.1697740909825; Thu, 19 Oct
 2023 11:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
In-Reply-To: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
From: Jasper Haag <jasper@bedrocksystems.com>
Date: Thu, 19 Oct 2023 14:41:38 -0400
Message-ID: <CA+c=0Weo8bw=PrGJ4yDbB1fCwZ93++ODuN79ob-QZ3tjyxrUOw@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: Awais Masood <awais@bedrocksystems.com>, Gordon Stewart <gordon@bedrocksystems.com>
Content-Type: multipart/alternative; boundary="000000000000d9ea700608161b7d"
Subject: [virtio-comment] Re: [virtio-queue] CLARIFICATION: "free descriptors" External

--000000000000d9ea700608161b7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

I hope you've been well since my last message. I'm still interested in
getting clarification regarding whether the use of the term "free
descriptor" in "2.7.13 - Supplying Buffers to The Device" <
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html=
#x1-6400013>
implies that compliant VIRTIO Drivers MUST NOT <
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html=
#x1-50003>
use the same descriptor within multiple chains.

Please let me know whether I can clarify any aspects of my question.

Regards,
Jasper Haag

On Thu, Oct 12, 2023 at 12:41=E2=80=AFPM Jasper Haag <jasper@bedrocksystems=
.com>
wrote:

> To whom it may concern,
>
> BedRock Systems is working to formally model VIRTIO Queues and formally
> verify our implementation of VIRTIO Queues <
> https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base>. One
> question which we've been unable to answer solely using the Standard text
> relates to "free descriptors" - as referred to within "2.7.13 - Supplying
> Buffers to The Device" <
> https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.ht=
ml#x1-6400013>.
> In particular, the text states:
>
> | 2.7.13 - Supplying Buffers to The Device
> | The driver offers buffers to one of the device=E2=80=99s virtqueues as =
follows:
> |     1. The driver places the buffer into free descriptor(s) in the
> descriptor table, chaining as necessary (see 2.7.5 The Virtqueue Descript=
or
> Table).
> |      .....
> |
> | 2.7.13.1 - Placing Buffers Into The Descriptor Table
> | A buffer consists of zero or more device-readable physically-contiguous
> elements followed by zero or more physically-contiguous device-writable
> elements (each has at least one element).
> | This algorithm maps it into the descriptor table to form a descriptor
> chain:
> | for each buffer element, b:
> |     1. Get the next free descriptor table entry, d
> |     2. Set d.addr to the physical address of the start of b
> |     3. Set d.len to the length of b.
> |     4. If b is device-writable, set d.flags to VIRTQ_DESC_F_WRITE,
> otherwise 0.
> |     5. If there is a buffer element after this:
> |         a. Set d.next to the index of the next free descriptor element.
> |         b. Set the VIRTQ_DESC_F_NEXT bit in d.flags.
> | In practice, d.next is usually used to chain free descriptors, and a
> separate count kept to check there are enough free descriptors before
> beginning the mappings.
>
> However, the term "free descriptor" doesn't appear to be defined anywhere
> within the Standard text. What characterizes such a "free descriptor", an=
d
> does the use of the term "free descriptor" imply that the Driver MUST NOT=
 <
> https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.ht=
ml#x1-50003>
> use the same descriptor within multiple chains?
>
> I look forward to hearing your clarification.
>
> Regards,
> Jasper Haag
>

--000000000000d9ea700608161b7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello again,</div><div><br></div><div>I hope you&#39;=
ve been well since my last message. I&#39;m still interested in getting cla=
rification regarding whether the use of the term &quot;free descriptor&quot=
; in &quot;2.7.13 - Supplying Buffers to The Device&quot; &lt;<a href=3D"ht=
tps://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x=
1-6400013" target=3D"_blank">https://docs.oasis-open.org/virtio/virtio/v1.2=
/csd01/virtio-v1.2-csd01.html#x1-6400013</a>&gt; implies that compliant VIR=
TIO Drivers MUST NOT &lt;<a href=3D"https://docs.oasis-open.org/virtio/virt=
io/v1.2/csd01/virtio-v1.2-csd01.html#x1-50003" target=3D"_blank">https://do=
cs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-50003<=
/a>&gt; use the same descriptor within multiple chains.</div><div><br></div=
><div>Please let me know whether I can clarify any aspects of my question.<=
br></div><div><br></div><div>Regards,</div><div>Jasper Haag<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Oct 12, 2023 at 12:41=E2=80=AFPM Jasper Haag &lt;<a href=3D"mailto:jasper=
@bedrocksystems.com">jasper@bedrocksystems.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span><div>To whom it may concern,</=
div><div><br></div></span><div>BedRock Systems is working to formally model=
 VIRTIO Queues and formally verify our implementation of VIRTIO Queues &lt;=
<a href=3D"https://github.com/bedrocksystems/vml/tree/main/devices/virtio_b=
ase" target=3D"_blank">https://github.com/bedrocksystems/vml/tree/main/devi=
ces/virtio_base</a>&gt;.
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
</blockquote></div>

--000000000000d9ea700608161b7d--
