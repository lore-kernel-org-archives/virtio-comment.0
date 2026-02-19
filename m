Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E527603F
	for <virtio-comment@lists.linux.dev>; Thu, 19 Feb 2026 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522283; cv=pass; b=l2jY8OA61MF30odQBXm/rFlgKpSn8CVhggCMrY5ubgCVPlXWYILnmXB+/TLuqv7zD1csaWGCYpa8lM0yQ/x2ASPHGwTlyWP84sX9Lrm0AHD9/wf1t6RHlAT32Oz9uvxe63p9bMtrp53prTvs5gK5WC9Tf6yGGyah+eGZFwNE6QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522283; c=relaxed/simple;
	bh=s6v+dOemNE/1m0JlEitC1I72NLKjCJRSaDBIr4wx7wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+Kx266AWGquf8AErqKws3Nwfs8m2o55BBKixrraCZYIMtxyeynM0qSi2eOpdVbjoWbcsupHpbuRIAWP+qHhf/jOH75gfnTgSMRitmBDubXva4WxVtYOhhdrIOiEBLfzn0iDVU4RPRoR5Xfv+BSvB+6J5selrIVa//1SnXlCjRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IAl7CJCY; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IAl7CJCY"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-505d3baf1a7so510651cf.1
        for <virtio-comment@lists.linux.dev>; Thu, 19 Feb 2026 09:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771522281; cv=none;
        d=google.com; s=arc-20240605;
        b=ctHvyThCl8hQ+DGIYGgcBRj6TqIMjuPGScl+T1WHXKzYBAODl1VHzhj8/HShIBACI2
         0mylm+LLba6+nj515syIOxAsKFA7/uZ0Th6EVpJG6NlIrvrM3IEkFuaw8MQ1/+gyTBMt
         mWUksoo4NZIYroB1hZ5JiWCu6p/e3JaNEge57/mQWzEGY4/06Rn/OvHBAncYydxPlkBR
         UIkC4bQFM1VyYKGS4iv+M26VeB5A4zJQjK1ByzL6Fma3wYV6PIka1GUdAs4kjuHxtbBJ
         8cJhnCEPuUayxJYG8UTy77XA5BUOzhX749V9isdZG2zz3fzq4pRQq7jDgVM8RPs4fgJn
         6qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQtiJqDK6EPMZaXF7Hl9nqIUc82o7Km+x/NyBgBKMHU=;
        fh=hvN7aH3R6x+qqY7pzBtBVtQYso0mnw55zvVbmX8bxqo=;
        b=Ilr+Oc5f8YhzhTIu0D5sjGr5ZyOoGz46KwFcwGXtccdGAjxf+CQaZT5GWWEcAVFECT
         fmY3wAazZ7pQolKn9hf26h9xlqMRGZB9CbnMqg5VJSH8fp2UtEXZCXebOBlu2DqooKwL
         DLWIi+FsTSr+ikAcW/7ssso3GbZGFGALVlh9SqjQpmgRLuDHswtUOUT5aLufokdpsX+o
         JtGLENGO7nLx0gSmCgYVszEPtIQ4QWiuNDEyDqjMdnYILkFx5A/mIYcR5hUQAdAqRHYG
         yZ0JLdI1crBECnGlOgBe95PHOMEcB4PAd6Js3Xc0ItQ3pEeVGwGUrcacHozpeRPtqio+
         MkoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771522281; x=1772127081; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xQtiJqDK6EPMZaXF7Hl9nqIUc82o7Km+x/NyBgBKMHU=;
        b=IAl7CJCYzqja+aq6gZ4LVlmop/rO2CMQeR0lpMveIEvKL/gXf+uAtAFOBSD/BSg8rh
         BRaHGwI9OAcwwa81n4vGC2nUw5IerI45sFeRdDG/p4PXub7BXzpCJ4i2iAt1ytVlrt/L
         BDa9uCd7RbmXV49NHCM26TpmpAd8T4LTtrqtkxUcE4A2oECpGpAa/d7Zdp9blRXoCyzI
         L9k/Vaqg6b2isDwjzUcQgNt9w48AXX+O3LXrhxB6Dl64oDZKrkoNDII7QRB6sDzPAM3i
         GyxHsAcAWzDeP9CbPEyLHVO/CqLXmP4gBH2Bp8EqHsCcf65A4tQ9+mZbCh+59dxKdYPi
         zw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771522281; x=1772127081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQtiJqDK6EPMZaXF7Hl9nqIUc82o7Km+x/NyBgBKMHU=;
        b=JhBo6KHh0kIYVJFOHWi2NEWY7/Ee9jK99Z2OmE9BwDx8mF8oNReVVOrZ4cc4NvRWht
         YL/6e8PcsmbdU36/uGcwS8bTajeOtRegf57U4Ma8gIIkhTOZAjspFscKyo8voGDKhd1+
         XcshoQbAjIc92dxyppxvW4OaYQeSkfFePF5jMfilR6nxxxB1N852HNalZuFtKgkxfNPf
         fKC5kip864ppRqwURH6G9cbTGuIqMaj3/BK8D+Wetz6wQmWmEfBRzwr1tiKftEy4usBy
         BsQvFRg455U2OLpXmrqQRRdErl5on4XkL/t+FN1QyRoKFPbgnLUQK0oXvwQ77PTdJL4b
         b0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXM576ZRApJk1rw3DrswODn+Pn3XR3CJxaePJwFvghKIlNL8VRZX474CRXdJjq4jFxKruFra2yCSZsqfGKCng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPU/jY5EAEsHGea7O3fMxeuAWMRe4NUzFjo/MRlc94J/PNU9Qb
	HmmDehf5wySqReZ90RyE3ygjvT16/ToTCx8fXU/XCsHTCNMfzXsHNa9bdW3g+XxlqUVnAwaKFJh
	3dCHWL5IjughDZIASutUgA8Nem2T3n64Mbh91vNYK
X-Gm-Gg: AZuq6aIjjU842zGiB3FhlG8fiXMUAnFeyjGT2V69ApUmBEHrptszagWfWJULxC2T58y
	lImFU+Uh1T99ZFf6vmgnu9rEdSPi0T/dpcWoAwz39cG+X2FhHYdNaR0LTW01tBBepVQNL9z8nKt
	4KTV5Epyzc0pqJe7WcfW6csIzhTuYmDbon4B5EyFCz64XJfI6nZTWsujdfc0f/J7uY07/J4wo3w
	CB2zhOSMo01+NKwrRHcVW1pkGTodDi45WdAL4IAlgC39CnT3Xk3UplcgDBV3an6Y2wtEXeGqech
	hdGQ3YDMQSWXnXgW4odpQc8odEuJOyoCCXyhPeni
X-Received: by 2002:a05:622a:110a:b0:4f1:a61a:1e8 with SMTP id
 d75a77b69052e-506f1e5f40emr12791621cf.10.1771522280740; Thu, 19 Feb 2026
 09:31:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <2d76963e-9aee-490e-99f7-fbd285c3092a@gmail.com>
In-Reply-To: <2d76963e-9aee-490e-99f7-fbd285c3092a@gmail.com>
From: Armelle Laine <armellel@google.com>
Date: Thu, 19 Feb 2026 09:31:09 -0800
X-Gm-Features: AaiRm51PczBvbrbbDbPu9N3aSKSEQx2-x1WpWPLTilI0YXR_9Pr-rzeeap-r78M
Message-ID: <CAAy_87-R3wF1FrCAe2P4i5gNwmVKeJv0L558vBb+X3yZRnR=bw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Parav Pandit <parav@nvidia.com>, Bill Mills <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000426bda064b30ac59"

--000000000000426bda064b30ac59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We are planning to release virtio-msg over FFA for Android Virtualization
Framework (AVF) pVM to TrustZone communication in the next Android release.
The Guest OS is Trusty OS, and the virtio-vsock over virtio-msg over FFA
driver/device support will be upstreamed to AOSP at the time of the release=
.

Acked-by: Armelle Laine armellel@google.com

Thanks,
Armelle

On Fri, Feb 13, 2026 at 11:45=E2=80=AFAM Demi Marie Obenour <demiobenour@gm=
ail.com>
wrote:

> On 2/13/26 08:52, Parav Pandit wrote:
> > Hi Bill,
> >
> >> From: Bill Mills <bill.mills@linaro.org>
> >> Sent: 26 January 2026 10:02 PM
> >>
> >> This series adds the virtio-msg transport layer.
> >>
> >> The individuals and organizations involved in this effort have had
> difficulty in
> >> using the existing virtio-transports in various situations and desire
> to add one
> >> more transport that performs its transport layer operations by sending
> and
> >> receiving messages.
> >>
> >> Implementations of virtio-msg will normally be done in multiple layers=
:
> >> * common / device level
> >> * bus level
> >>
> >> The common / device level defines the messages exchanged between the
> driver
> >> and a device. This common part should lead to a common driver holding
> most
> >> of the virtio specifics and can be shared by all virtio-msg bus
> implementations.
> >> The kernel implementation in [3] shows this separation. As with other
> transport
> >> layers, virtio-msg should not require modifications to existing virtio
> device
> >> implementations (virtio-net, virtio-blk etc). The common / device leve=
l
> is the
> >> main focus of this version of the patch series.
> >>
> >> The virtio-msg bus level implements the normal things a bus defines
> >> (enumeration, dma operations, etc) but also implements the message sen=
d
> and
> >> receive operations. A number of bus implementations are envisioned,
> >> some of which will be reusable and general purpose. Other bus
> implementations
> >> might be unique to a given situation, for example only used by a PCIe
> card
> >> and its driver.
> >>
> >> The standard bus messages are an effort to avoid different bus
> implementations
> >> doing the same thing in different ways for no good reason. However the
> >> different environments will require different things. Instead of tryin=
g
> to
> >> anticipate all needs and provide something very abstract, we think
> >> implementation specific messages will be needed at the bus level. Over
> time,
> >> if we see similar messages across multiple bus implementations, we wil=
l
> move to
> >> standardize a bus level message for that.
> >>
> >
> > I would review more, had first round of sparse review.
> > Please find few comments/questions below.
> >
> > 1. device number should be 32-bit in struct virtio_msg_header.
> > From SIOV_R2 experiences, we learnt that some uses have use case for
> more than 64k devices.
> > Also mapping PCI BDF wont be enough in 16-bits considering domain field=
.
>
> I recommend using a 64-bit or even 128-bit number.  This allows
> ensuring that device IDs are unique for the life of a VM or even
> globally, making reasoning about device identity simpler.
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)

--000000000000426bda064b30ac59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>We are planning=
 to release virtio-msg over FFA for Android Virtualization Framework (AVF) =
pVM to TrustZone communication in the next Android release. The Guest OS is=
 Trusty OS, and the virtio-vsock over virtio-msg over FFA driver/device sup=
port will be upstreamed to AOSP at the time of the release.</div><div><br><=
/div><div>Acked-by: Armelle Laine <a href=3D"mailto:armellel@google.com">ar=
mellel@google.com</a></div><div><br></div><div>Thanks,</div><div>Armelle</d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Feb 13, 2026 at 11:45=E2=80=AFAM Demi Mari=
e Obenour &lt;<a href=3D"mailto:demiobenour@gmail.com">demiobenour@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 2/13/26 08:52, Parav Pandit wrote:<br>
&gt; Hi Bill,<br>
&gt; <br>
&gt;&gt; From: Bill Mills &lt;<a href=3D"mailto:bill.mills@linaro.org" targ=
et=3D"_blank">bill.mills@linaro.org</a>&gt;<br>
&gt;&gt; Sent: 26 January 2026 10:02 PM<br>
&gt;&gt;<br>
&gt;&gt; This series adds the virtio-msg transport layer.<br>
&gt;&gt;<br>
&gt;&gt; The individuals and organizations involved in this effort have had=
 difficulty in<br>
&gt;&gt; using the existing virtio-transports in various situations and des=
ire to add one<br>
&gt;&gt; more transport that performs its transport layer operations by sen=
ding and<br>
&gt;&gt; receiving messages.<br>
&gt;&gt;<br>
&gt;&gt; Implementations of virtio-msg will normally be done in multiple la=
yers:<br>
&gt;&gt; * common / device level<br>
&gt;&gt; * bus level<br>
&gt;&gt;<br>
&gt;&gt; The common / device level defines the messages exchanged between t=
he driver<br>
&gt;&gt; and a device. This common part should lead to a common driver hold=
ing most<br>
&gt;&gt; of the virtio specifics and can be shared by all virtio-msg bus im=
plementations.<br>
&gt;&gt; The kernel implementation in [3] shows this separation. As with ot=
her transport<br>
&gt;&gt; layers, virtio-msg should not require modifications to existing vi=
rtio device<br>
&gt;&gt; implementations (virtio-net, virtio-blk etc). The common / device =
level is the<br>
&gt;&gt; main focus of this version of the patch series.<br>
&gt;&gt;<br>
&gt;&gt; The virtio-msg bus level implements the normal things a bus define=
s<br>
&gt;&gt; (enumeration, dma operations, etc) but also implements the message=
 send and<br>
&gt;&gt; receive operations. A number of bus implementations are envisioned=
,<br>
&gt;&gt; some of which will be reusable and general purpose. Other bus impl=
ementations<br>
&gt;&gt; might be unique to a given situation, for example only used by a P=
CIe card<br>
&gt;&gt; and its driver.<br>
&gt;&gt;<br>
&gt;&gt; The standard bus messages are an effort to avoid different bus imp=
lementations<br>
&gt;&gt; doing the same thing in different ways for no good reason. However=
 the<br>
&gt;&gt; different environments will require different things. Instead of t=
rying to<br>
&gt;&gt; anticipate all needs and provide something very abstract, we think=
<br>
&gt;&gt; implementation specific messages will be needed at the bus level. =
Over time,<br>
&gt;&gt; if we see similar messages across multiple bus implementations, we=
 will move to<br>
&gt;&gt; standardize a bus level message for that.<br>
&gt;&gt;<br>
&gt; <br>
&gt; I would review more, had first round of sparse review.<br>
&gt; Please find few comments/questions below.<br>
&gt; <br>
&gt; 1. device number should be 32-bit in struct virtio_msg_header.<br>
&gt; From SIOV_R2 experiences, we learnt that some uses have use case for m=
ore than 64k devices.<br>
&gt; Also mapping PCI BDF wont be enough in 16-bits considering domain fiel=
d.<br>
<br>
I recommend using a 64-bit or even 128-bit number.=C2=A0 This allows<br>
ensuring that device IDs are unique for the life of a VM or even<br>
globally, making reasoning about device identity simpler.<br>
-- <br>
Sincerely,<br>
Demi Marie Obenour (she/her/hers)</blockquote></div>

--000000000000426bda064b30ac59--
