Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC4542076
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294340; cv=none; b=b2UhyoFtlwG26vbeDCphj/3VFQhcUj4EdG9FkKhwOMmEPEyWOmTj0Hmad9NN1hkoU37Q92mNk+q42nCGiJ24szLOllT0kbp77vWYR+JS5eMnC/pP4j83k4bzVCXTGREBSAKjYARR8v2XdxW5GStKuqvhepiRWTMijNzQW64D2lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294340; c=relaxed/simple;
	bh=e/Uf8uIRGGBhrkn+zTT2cPSbNR79BR91ZZsPLEPfDaE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IX9A1m8KzH4BnakxCM1l2fZB4GfQEmAkOkjt05AuCWn/7iOsZXGSP7On2vxP4gysPHr9hYDy1UOtrliRFRoNA9zT6Y9Rs03D1nUSjSv9ibHyBcp1xVebOr9+BgZ/i1xij8SnmYkTdAgmfoCzo2c4U6XKFjxv+wBfqOUOSVbeQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9sUkvWn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9sUkvWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716294337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IU5mfPE0ZcCMJ87eYIlY6yNzyMNUO68FxLT1kbFfDpA=;
	b=V9sUkvWnpo+3/qSJW9G7MV1y95zRefE2gNgtgcoMYGNhOY6Ua5sRuysEObKfDSWBgvzS5g
	Y9BVL31xE3AWsfdO5sly2ijTTNpYJZHxO7esknNRLXGb6FnQNbitBd5YoHnVZveZRfHVdc
	/ur78L5r7aLcjfY1RLEVqQJSnZRCleg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-x442oFlmPeaRdqI6IdalHw-1; Tue, 21 May 2024 08:25:33 -0400
X-MC-Unique: x442oFlmPeaRdqI6IdalHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0133A800994;
	Tue, 21 May 2024 12:25:33 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B895A105480A;
	Tue, 21 May 2024 12:25:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar
 <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev, Vincent Guittot
 <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
In-Reply-To: <20240521073925-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <20240520092332-mutt-send-email-mst@kernel.org>
 <20240521105706.tbyigihommrasdua@vireshk-i7>
 <20240521073925-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 21 May 2024 14:25:31 +0200
Message-ID: <871q5v8i84.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, May 21 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, May 21, 2024 at 04:27:06PM +0530, Viresh Kumar wrote:
>> On 20-05-24, 09:27, Michael S. Tsirkin wrote:
>> > On Mon, May 20, 2024 at 02:59:40PM +0530, Viresh Kumar wrote:
>> > > diff --git a/content.tex b/content.tex
>> > > index 0a62dce5f65f..a79993b5ed69 100644
>> > > --- a/content.tex
>> > > +++ b/content.tex
>> > > @@ -631,8 +631,82 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>> > >  
>> > >  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>> > >  
>> > > -Virtio can use various different buses, thus the standard is split
>> > > -into virtio general and bus-specific sections.
>> 
>> > > +Devices and drivers can use different transport methods to enable
>> > > +interaction, for example PCI, MMIO, or Channel I/O. The transport
>> > > +methods define various aspects of the communication between the device
>> > > +and the driver, like device discovery, exchanging capabilities,
>> > > +interrupt handling, data transfer, etc. For example, in a host/guest
>> > > +architecture, the host might expose a device to the guest on a PCI bus,
>> > > +and the guest will use a PCI-specific driver to interact with it.
>> > > +
>> > > +The standard is split into sections describing general virtio
>> > > +implementation and transport-specific sections.
>> > > +
>> > 
>> > This makes it seem like trasport is distinct from both
>> > device and driver. Makes no sense to me.
>> 
>> Yeah, looks wrongly worded. I think we can just retain the earlier
>> statement here:
>> 
>> Virtio can use various different buses, thus the standard is split
>> into virtio general and bus-specific sections.

I don't really like the "bus" term here: PCI is a bus, but there is no
need for a transport to be implemented via a bus.

Maybe

"The standard contains sections describing the transport-agnostic parts
of virtio, and sections describing how individual transports implement
virtio."

>> 
>> > > +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
>> > > +
>> > > +The device MUST keep any data associated with a device-initiated
>> > > +transaction accessible to the driver until the driver acknowledges the
>> > > +transaction to be complete.
>> > > +
>> > > +The device MUST NOT access the contents of a virtqueue before the
>> > > +driver notifies, in a transport defined way, the device that the
>> > > +virtqueue is ready to be accessed.
>> > > +
>> > > +The device MUST NOT access or modify buffers on a virtqueue after it has
>> > > +notified the driver about their availability.
>> > > +
>> > > +The device MUST reset the virtqueues if requested by the driver, in a
>> > > +transport defined way, if the transport provides such a method.
>> > > +
>> > > +\drivernormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
>> > > +
>> > > +The driver MUST acknowledge device notifications, as mandated by the
>> > > +transport.
>> > > +
>> > > +The driver MUST NOT access virtqueue contents before the device notifies
>> > > +about the readiness of the same.
>> > > +
>> > > +The driver MUST NOT access buffers, after it has added them to the
>> > > +virtqueue and notified the device about their availability. The driver
>> > > +MAY access them after the device has processed them and notified the
>> > > +driver of their availability, in a transport defined way.
>> > > +
>> > > +The driver MAY ask the device to reset the virtqueues if, for example,
>> > > +the driver times out waiting for a notification from the device for a
>> > > +previously queued request.
>> > >  
>> > 
>> > This makes no sense in a normative section.
>> 
>> I am okay with wherever you and Cornelia decide to put this.
>> 
>> > Normative statements are for implementations not spec writers.
>> 
>> Hmm.

So anyone implementing a transport needs to be able to figure out
conformance just by looking at the individual transport's normative
statements? Have we cross-checked whether things are clear? Because
then...

>> 
>> > If you think of defining lots of new transports
>> > (questionable)
>> 
>> There is just one in discussion at the moment on the ARM side,
>> virtio-msg (for communication between the VMs), but nothing is
>> finalized yet.
>
>
> I feel a non-normative section is enough for this.
> Just convert should/must to direct speech.

...I think this would be fine.

>
>> > I think a new non-normative section
>> > along the lines of newdevice.tex will make sense.

[Generally, I'm not sure how consistent we are for the individual
transports. PCI is what most people are focusing on; CCW does not really
see much development anymore (at least in the projects that I'm aware
of); not sure how well-loved MMIO still is.]

