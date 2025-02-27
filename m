Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386613A3F2
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645267; cv=none; b=Vp/gs1o4WnLujKkxS/hrOvNCO60a+Chn6F9C1FUEez91tqn37/9PnehIiyFNJW1ru2SfFM3yS8ZPiO4FHPRro0WYc+b1DtS22y18cSrMRnSWH4Y2QrfpCsAQVr9GA/UT4jXktiSpwgXXlnZ6pkFePviaAgI01QXrMJ6tLCFQXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645267; c=relaxed/simple;
	bh=dKjY65AIWIc45CICGSNRLO8pRylEWkpul2H50zsQNLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llXfuz2RoOJZiaqEEnueWAeV4A1y6YEZueitQdIFRnHyZVEMlXofXdbIgMA530tYnGkESyakYFCtB/oFDD/VeW+J3gtC+hHSUZoR4OGZ+YzxsmE2gBU9JK9byVW6pB7dS35fcdLTzX4NO1xF1xXAPJkCGpa5dplnVsEukGBYbjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QbYQN81+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbYQN81+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740645264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HV8CR9kAYVg6InR9lXbXtvILK13KKOWJBfS8gcoKbis=;
	b=QbYQN81+vJILiWTixrGXXrJUqGl5z/AmAw6hBJG6SLIg2hFnuYx06anAbAyuPUGRDOBZQE
	yfBJt77njc/kMW3YLgE6wEgLysBTWk7wPF8ve5XlVxPUgpDYzBrPLc/8R6WE756Q5N7uLa
	5Qo5Ke1aSMojjOBatLavhzdEXxdO6Fk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-aYv-aIG-N96a9EJFLKeIQQ-1; Thu, 27 Feb 2025 03:34:22 -0500
X-MC-Unique: aYv-aIG-N96a9EJFLKeIQQ-1
X-Mimecast-MFC-AGG-ID: aYv-aIG-N96a9EJFLKeIQQ_1740645261
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc0bc05afdso1805895a91.0
        for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 00:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740645261; x=1741250061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HV8CR9kAYVg6InR9lXbXtvILK13KKOWJBfS8gcoKbis=;
        b=kY0MaOJNSfFhG/Sp1HnK6qHUj7Yi8xfEld5k+R1VMFaIhTXkmTjaqV8oLBtKGMPglz
         svBmKoqhdvXCt5T84Fhl2eDL6XpfQMgGHPUgNsR3z+Rh+7FgzLIZiYUyJFCba9Rj4kX/
         dVUYyHNYKpZWw6ukoxfQJF8zl70i3VN9+/pZzEtbGYt5HmazLFVkaRH9FsTRDF6krFAW
         nynZNMvn/KeOsjyHT0XESM44JqTGJUyi6FjJBe4YreLc9F0LUp7JP4+n4WMN5YAT24Mn
         KAMYccKixyYR9oSVBq5jAAAjIH/fs91Gzt3KcM4/siqaJ155TUYBOr0RJRO9FObi408d
         1NhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVLgqCRtl6e6K8iugBbBnItm6n9I4QcjxRPPMidVyvAZk1KeV2JLFyi53zEkh015Kqg2pFdK62ZS1kU28baA==@lists.linux.dev
X-Gm-Message-State: AOJu0YysOAqHWhhunyo0IQYcoEv5Djqv32DrE2xxfrtgK1qh8T3ixECs
	doAnc/Q8RNV8hnPLOjeJWyJSS06PPEhdBJ/vXk1WNkNAWBi5oZDmE7CWjm65oCSylBRh2hKfs+v
	ipnCnoBQ6RNToFTExOVIVoZGvtTRtg+hfJPDzXDaX0A3i8EHbeKp0E7q9QX/AHr3WKwr9vckZ9d
	GnJpfwAra7gHu+6n/uu+upt19K7giFDRNdOiFzVa8=
X-Gm-Gg: ASbGncubBOX2h+USI/C400rGajeo8BVafuyEY6DgGTkKOv6Iq0gqCAdfmwqGDhTD+iv
	uLWRHvD5HdHw6GaM510GXTTqj+viwj9g59z4cVBg2jkSopTvfKQxo57UWLBNpvATxwHPslewd
X-Received: by 2002:a17:90b:2590:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-2fe68ada4cemr17556608a91.11.1740645261368;
        Thu, 27 Feb 2025 00:34:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWb7ChQ7ftyRn/XbC7W6MU6Fl4478KDHTxv6LEnQXTtsEGFAXU9PSUKkALch5P7yMAlce2TYJCqVVWiI7S7/A=
X-Received: by 2002:a17:90b:2590:b0:2ee:d63f:d73 with SMTP id
 98e67ed59e1d1-2fe68ada4cemr17556575a91.11.1740645261040; Thu, 27 Feb 2025
 00:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225134801.3546224-1-bill.mills@linaro.org>
 <20250227025757-mutt-send-email-mst@kernel.org> <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
In-Reply-To: <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 27 Feb 2025 16:34:09 +0800
X-Gm-Features: AQ5f1Jp_kXlJtPU4sy4VHiH4mypW-PNrc290ruV_SN-G7v7bctghtNglqxgOLwI
Message-ID: <CACGkMEtxuSZ-Qk7kP8fEzLG1zo3a-=XuZKhd1J5h7ZtFQT3JMw@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NERM7DMJSQjxCHOenhlkZ_mZPZ6TODLOqlY0G2uL9yI_1740645261
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:32=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Thu, Feb 27, 2025 at 4:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
> > > This series adds the virtio-msg transport layer.
> > >
> > > The individuals and organizations involved in this effort have had di=
fficulty in
> > > using the existing virtio-transports in various situations and desire=
 to add one
> > > more transport that performs its transport layer operations by sendin=
g and
> > > receiving messages.
> > >
> > > Implementations of virtio-msg will normally be done in multiple layer=
s:
> > > * common / device level
> > > * bus level
> > >
> > > The common / device level defines the messages exchanged between the =
driver
> > > and a device. This common part should lead to a common driver holding=
 most
> > > of the virtio specifics and can be shared by all virtio-msg bus imple=
mentations.
> > > The kernel implementation in [3] shows this separation. As with other=
 transport
> > > layers, virtio-msg should not require modifications to existing virti=
o device
> > > implementations (virtio-net, virtio-blk etc). The common / device lev=
el is the
> > > main focus of this version of the patch series.
> > >
> > > The virtio-msg bus level implements the normal things a bus defines
> > > (enumeration, dma operations, etc) but also implements the message se=
nd and
> > > receive operations. A number of bus implementations are envisioned,
> > > some of which will be reusable and general purpose. Other bus impleme=
ntations
> > > might be unique to a given situation, for example only used by a PCIe=
 card
> > > and its driver.
> > >
> > > How much of the bus level should be described in the virtio spec is o=
ne item
> > > we wish to discuss. This draft takes a middle approach by describing =
the bus
> > > level and defining some standard bus level messages that MAY be used =
by the bus.
> > > It also describes a range of bus messages that are implementation dep=
endent.
> > >
> > > The standard bus messages are an effort to avoid different bus implem=
entations
> > > doing the same thing in different ways for no good reason. However th=
e
> > > different environments will require different things. Instead of tryi=
ng to
> > > anticipate all needs and provide something very abstract, we think
> > > implementation specific messages will be needed at the bus level. Ove=
r time,
> > > if we see similar messages across multiple bus implementations, we wi=
ll move to
> > > standardize a bus level message for that.
> > >
> > > We are working on two reusable bus implementations:
> > >
> > > * virtio-msg-ffa based on Arm FF-A interface for use between:
> > >   * normal world and secure world
> > >   * host and VM or VM to VM
> > >   * Can be used w/ or with out a hypervisor
> > >   * Any Hypervisor that implements FF-A can be used
> > >
> > > * virtio-msg-amp for use between heterogenous systems
> > >   * The main processors and its co-processors on an AMP SOC
> > >   * Two or more systems connected via PCIe
> > >   * Minimal requirements: bi-directional interrupts and
> > >     at least one shared memory area
> > >
> > > We also anticipate a third:
> > >
> > > * virtio-msg-xen specific to Xen
> > >   * Usable on any Xen system (including x86 where FF-A does not exist=
)
> > >   * Using Xen events and page grants
> >
> > I am also interested in virtio-msg-admin-cmd, sending messages to VFs
> > over the admin commands of the PF.
>
> One more thing, there used to be a similar proposal which is the
> transport virtqueue which also defines the message. And it has the
> chance to be unified with the admin command. Need to think about the
> (dis)advantages of each proposal.
>
> What's more, if the actual method to send and receive the message,

I meant "if the actual method to send and receive the message is
implementation or architecture specific".

> can
> we still call this a transport or not?
>
> Thanks

Thanks

