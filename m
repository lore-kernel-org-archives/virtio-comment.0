Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F99241CB5
	for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730740; cv=none; b=smSVBwWkIuVzl2CFKhNGanJgkhLcDQpMyoJqjWZboGorDhjo6hgE2NdlX/w2YmOHVu1fL+PSCsVGXR/hauAO9pAjXlhR2g+vnsVc2SDx2V1fMxKjP8UsYdzXookfT6u42sf43JOE8q1iq78os2BEJS4pLGF0WMXAVQWu2o4OKBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730740; c=relaxed/simple;
	bh=lXTj63DbA/U6lTFQdwIpLPfrZq+51CpICaOrKzpLlUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1u+sDXpn+ES4LpoIqgFyRqayl4AQ0VKHjOMvRAv14YYlyTGcz/bdtocODERihh7I5Lieo84kK+o5h7dDFRv2LCL0EYm1kKvKsufMbShA8NB8qZ4Vv99uMuPQUUMAUoqCcnNE8mj6ESZUSMy8oDI3W6REXI98MKN691/AJEIgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKA1uPo1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKA1uPo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740730736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLCZ31wP8qkQ5u84z8j849oaqYaucpVjP54l03/nFxw=;
	b=bKA1uPo1h6f5F71o87OhiIjNwqHj2F6VzdvlwkIq+1IBa4yzI9RFvO1Nyz5+NhJX/BRuWv
	G1nRy5lzE72CpRoJpup3cGMw4nsKmDO95ZGYKXQQSfjcNpSg/JX1nGvSrWJdhYIpLL271y
	XBmKxpBPuoveSz0usn2qvBOQkW+ktMk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-B402LsxKP-OtJexDTJ3_XA-1; Fri, 28 Feb 2025 03:18:54 -0500
X-MC-Unique: B402LsxKP-OtJexDTJ3_XA-1
X-Mimecast-MFC-AGG-ID: B402LsxKP-OtJexDTJ3_XA_1740730733
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc518f0564so4301330a91.2
        for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 00:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730733; x=1741335533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLCZ31wP8qkQ5u84z8j849oaqYaucpVjP54l03/nFxw=;
        b=Y3IjXxN8Ao+K0f6hkJni3Y5fS8WP4OnU9qtI7ktySMso9pD4tjwiFi6KZGsh/d3MQ4
         hhVHLLeYJKQSYMLoD3hJ1lbfyyVdeREoBfacM4o3+smur2Yg/9nAt0HxhzZoh4DA2v72
         HEblZRYMgEVLJmyj6eMoEDGokCBMsFyNzDMeZYV74D4jb8Sikg6xwAjMW2in6hVhNfdG
         PhaWtTcH9y4/eNBJQEpRfOrVD8W8qg9lbmStU/8Rw59bLIqOGdtHiHU4i4HaAs9TN1O9
         2yIDfZvPcsptHfP7Ch81MZ4rY9GLzpf1UiH9lomXps1CA0ZF0Zz8AtPRRJzZgCyX6A5j
         +BEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe+jtS/NzIRfUCclumNnWozUb7tNtCKPvn6+IhGTD1QFfSVcE2P2atY1OCSkZFsZoLncKancz3p8THpQlC5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3fpItecyY5cBnI+yr7jyluAAI3BzXsu79KOKxQ7Vm2LxaVmFW
	oQxx6Uuayw4vYCrYN00/bo69zxCQkSqJMfBRQgI5OK1/h7bBJe2qoteYyOiz/XyvEhbAm/LrQb1
	2j3Dg272aDcOObY98NrBn23bv7T73GSsPAiVfAQ5CMJIpoESKntbO1UK+X07IyzfKlOOiDGgrXu
	7dFZx59Jl/+Akzyk136+wOD8sYS7g3VTVmSugN9w4QhR4h0lo9bGV1
X-Gm-Gg: ASbGnct1RPuVyGWWjeyZR6btlbHlqC2iNuHSbfi1g9nEWJUf9PjNlUJ5OGiMC35adyW
	wHR3O0DjcpLNS2SXk5ELf07i2k7UJO04N1MSCU/AotpmBPNQh7b/X1kgiT4WqC8MW2cF9erOE4A
	==
X-Received: by 2002:a17:90b:3511:b0:2fa:1f1b:3db2 with SMTP id 98e67ed59e1d1-2febabcfedfmr4014581a91.25.1740730732862;
        Fri, 28 Feb 2025 00:18:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4D/yHV4Jpa+ajZ8hTOqQB6fz6ZUUMw69rY3ml2+TtaNM6cr+d7Sg4m9qGtdOvwfhwk6eQ5li6Q8UqzGw+uKQ=
X-Received: by 2002:a17:90b:3511:b0:2fa:1f1b:3db2 with SMTP id
 98e67ed59e1d1-2febabcfedfmr4014550a91.25.1740730732429; Fri, 28 Feb 2025
 00:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225134801.3546224-1-bill.mills@linaro.org>
 <20250227025757-mutt-send-email-mst@kernel.org> <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
 <CACGkMEtxuSZ-Qk7kP8fEzLG1zo3a-=XuZKhd1J5h7ZtFQT3JMw@mail.gmail.com> <2f095da4-44a8-48ae-a078-60ec3e04d3b8@linaro.org>
In-Reply-To: <2f095da4-44a8-48ae-a078-60ec3e04d3b8@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Feb 2025 16:18:40 +0800
X-Gm-Features: AQ5f1Jp7HYBhidpPtEqpjii73rX9ETh6Z7IR6YCYUTts6oyLb3Jf7frT7aFC92U
Message-ID: <CACGkMEvot77Dv6MRJC1fuy3t+kLvZi2JxeWZqm4=dKtJ87RO+g@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
To: Bill Mills <bill.mills@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G7GX4vWqfPUShT3cRRRgsLBsLjPF_ksi_yfZWxethr8_1740730733
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 10:40=E2=80=AFPM Bill Mills <bill.mills@linaro.org>=
 wrote:
>
> Hi Jason and Michael,
>
> Thanks for taking a look, we appreciate it.
>
> On 2/27/25 3:34 AM, Jason Wang wrote:
> > On Thu, Feb 27, 2025 at 4:32=E2=80=AFPM Jason Wang <jasowang@redhat.com=
> wrote:
> >>
> >> On Thu, Feb 27, 2025 at 4:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> >>>
> >>> On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
> >>>> This series adds the virtio-msg transport layer.
> >>>>
> >>>> The individuals and organizations involved in this effort have had d=
ifficulty in
> >>>> using the existing virtio-transports in various situations and desir=
e to add one
> >>>> more transport that performs its transport layer operations by sendi=
ng and
> >>>> receiving messages.
> >>>>
> >>>> Implementations of virtio-msg will normally be done in multiple laye=
rs:
> >>>> * common / device level
> >>>> * bus level
> >>>>
> >>>> The common / device level defines the messages exchanged between the=
 driver
> >>>> and a device. This common part should lead to a common driver holdin=
g most
> >>>> of the virtio specifics and can be shared by all virtio-msg bus impl=
ementations.
> >>>> The kernel implementation in [3] shows this separation. As with othe=
r transport
> >>>> layers, virtio-msg should not require modifications to existing virt=
io device
> >>>> implementations (virtio-net, virtio-blk etc). The common / device le=
vel is the
> >>>> main focus of this version of the patch series.
> >>>>
> >>>> The virtio-msg bus level implements the normal things a bus defines
> >>>> (enumeration, dma operations, etc) but also implements the message s=
end and
> >>>> receive operations. A number of bus implementations are envisioned,
> >>>> some of which will be reusable and general purpose. Other bus implem=
entations
> >>>> might be unique to a given situation, for example only used by a PCI=
e card
> >>>> and its driver.
> >>>>
> >>>> How much of the bus level should be described in the virtio spec is =
one item
> >>>> we wish to discuss. This draft takes a middle approach by describing=
 the bus
> >>>> level and defining some standard bus level messages that MAY be used=
 by the bus.
> >>>> It also describes a range of bus messages that are implementation de=
pendent.
> >>>>
> >>>> The standard bus messages are an effort to avoid different bus imple=
mentations
> >>>> doing the same thing in different ways for no good reason. However t=
he
> >>>> different environments will require different things. Instead of try=
ing to
> >>>> anticipate all needs and provide something very abstract, we think
> >>>> implementation specific messages will be needed at the bus level. Ov=
er time,
> >>>> if we see similar messages across multiple bus implementations, we w=
ill move to
> >>>> standardize a bus level message for that.
> >>>>
> >>>> We are working on two reusable bus implementations:
> >>>>
> >>>> * virtio-msg-ffa based on Arm FF-A interface for use between:
> >>>>   * normal world and secure world
> >>>>   * host and VM or VM to VM
> >>>>   * Can be used w/ or with out a hypervisor
> >>>>   * Any Hypervisor that implements FF-A can be used
> >>>>
> >>>> * virtio-msg-amp for use between heterogenous systems
> >>>>   * The main processors and its co-processors on an AMP SOC
> >>>>   * Two or more systems connected via PCIe
> >>>>   * Minimal requirements: bi-directional interrupts and
> >>>>     at least one shared memory area
> >>>>
> >>>> We also anticipate a third:
> >>>>
> >>>> * virtio-msg-xen specific to Xen
> >>>>   * Usable on any Xen system (including x86 where FF-A does not exis=
t)
> >>>>   * Using Xen events and page grants
> >>>
> >>> I am also interested in virtio-msg-admin-cmd, sending messages to VFs
> >>> over the admin commands of the PF.
> >>
> >> One more thing, there used to be a similar proposal which is the
> >> transport virtqueue which also defines the message. And it has the
> >> chance to be unified with the admin command. Need to think about the
> >> (dis)advantages of each proposal.
>
> If you are taking about replacing virtqueues with messages, this is a ver=
y
> different concept.  That certainly has merit but is not this model.

I basically meant the transport virtqueue proposal also defines
message format for being a transport.

>
> The size of "direct" messages in FF-A has to fit into registers and norma=
l
> world to secure world needs direct messages (I am told.  I am not the
> secure world or FF-A expert).
>
> In many of our use cases this would require one or two more memcpy's for
> the buffers.
>
> If I am wrong about the context of you comment, please let me know and if
> you have a reference that would be great.
>
> >>
> >> What's more, if the actual method to send and receive the message,
> >
> > I meant "if the actual method to send and receive the message is
> > implementation or architecture specific".
> >
> >> can
> >> we still call this a transport or not?
> >>
>
> Yes I understand the issue.  It is really a spec for a family of transpor=
ts
> that have a lot in common.
>
> virtio-msg-ffa will be a fully specified transport.  We do plan to write =
a
> spec for that but it will also include lots of FF-A specific things and
> include details about how to setup shared memory areas, map them, and how
> the bus addresses in the virtqueue should look like.  These are details
> that are not normally addressed in the virtio spec.  I think Arm was
> thinking this would be an Arm document adjacent to or included in the FF-=
A
> spec.  I could also see it as an appendix to the virtio spec or something
> similar.
>
> Likewise, the virtio-msg-amp will be a full transport layer but will need
> DT bindings to find its shared memories, know how to map that memory, wha=
t
> IRQ to expect, and how to poke the other side.  It will also be able to b=
e
> used w/o DT from a PCI driver that knows how to specify these things. I
> plan to also write a spec addendum for virtio-msg-amp.

This sounds fine.

>
> All good questions and comments.  Please take a look at what we have righ=
t
> now for the big picture and we can work the form

I wonder if some of the work could be unified or reused. (I'm totally
fine it they can't but I need to know why).

Thanks

>
> Thanks,
> Bill
>

