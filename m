Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292EA13C90E
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686267; cv=none; b=BbfnGAVVrQpsmCSEPkTKotlnA4AiEq/l8jAN2PT55KCvYGzna8737aSs2W6nrYi41ZWXYLGXawNacD/BQNW4ZXk/6qDxl2lu5oTRAP+V9CPiRW56BosYpIDXHz2cvQD2QKthbzGviKA6BdTrfCQqlEkOyrNAR1B5OASpeeTpJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686267; c=relaxed/simple;
	bh=NSEGf0Pd1vsQTUp2YsRARInYviStNf6o8hYdkC52WgE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HWLaxvWjjiyBCO4uITdpaED2ty8l2Ab1k3KMBZ1ygx9W4s7oLR21Woz9RWl1RhYwRyiT1j5NEdp3Bw7Lcf6yPnb0M2/tPxmX97PKwy7OMBy04xhOdUO5NuCtb/hQvneRQ5IczBw03X8BlDSPrFnprBERQ7uUWJVP7o34YKH36Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bc3Whppi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bc3Whppi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720686265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rQe3DD/jaF6Ba/BUijgUR2YiQfeWPVj4E+00tBmaUQ=;
	b=bc3WhppicHLKaJVZmvnA9NRcldl5gWVKaf6omTE9w9tk0Z0973WNqS53P7vaNZ+XTts/AA
	TkBGumz8v2FQAAdg4ZeewSS3vhykVfnZhrAhEzk5Ty8htZN6QJHEntE0Bkij43AZSBwkRe
	S/IlO1yFRRwcMm5js3cYZ3NGdTs+hjQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-pxmzsr7HM2WD4QTVS6aq3w-1; Thu,
 11 Jul 2024 04:24:21 -0400
X-MC-Unique: pxmzsr7HM2WD4QTVS6aq3w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7E82196CDF5;
	Thu, 11 Jul 2024 08:24:20 +0000 (UTC)
Received: from localhost (dhcp-192-176.str.redhat.com [10.33.192.176])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5985B1956046;
	Thu, 11 Jul 2024 08:24:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, Matias Ezequiel Vara
 Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
In-Reply-To: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 11 Jul 2024 10:24:16 +0200
Message-ID: <8734ogcp5b.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> The virtio documentation currently doesn't define any generic
> requirements that are applicable to all transports. They can be useful
> while adding support for a new transport.
>
> This commit tries to define the same under a new Appendix section.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V6->V7:
> - Remove parts that talk about accessing content of the virtqueue.
>
> V5->V6:
> - Move the changes to a new appendix section.
> - Clarify the requirements a bit more based on review comments.
>
> V4->V5:
> - s/The transport/A transport/
> - s/MUST provide/provides/
> - Added some text for transport requirements.
>
> V3->V4:
> - Remove the normative sections and use direct speech.
> - Change wording at few places.
>
> V2->V3:
> - Minor fixes.
> - Added Reviewed by from Alex.
>
> V1->V2:
> - Lot of changes after discussions with Alex and Cornelia.
> - Almost a rewrite of the first commit.
> - Add Transport normative sections.
>
>  main.tex         |  2 ++
>  newtransport.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 newtransport.tex
>
> diff --git a/main.tex b/main.tex
> index b1913d65e964..6d337217a3d1 100644
> --- a/main.tex
> +++ b/main.tex
> @@ -42,6 +42,8 @@
> =20
>  \input{newdevice.tex}
> =20
> +\input{newtransport.tex}
> +
>  % acknowledgements
>  \input{acknowledgements.tex}=20
> =20
> diff --git a/newtransport.tex b/newtransport.tex
> new file mode 100644
> index 000000000000..2abd76e5b037
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,72 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers can use different transport methods to enable
> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> +methods define various aspects of the communication between the device
> +and the driver, like device discovery, exchanging capabilities,
> +interrupt handling, data transfer, etc. For example, in a host/guest
> +architecture, the host might expose a device to the guest on a PCI bus,
> +and the guest will use a PCI-specific driver to interact with it.
> +
> +There are some mechanisms that any transport is required to implement,
> +and some requirements that devices and drivers are required to follow.
> +
> +\section{Transport Requirements}\label{sec:Creating New Transports / Tra=
nsport Requirements}
> +
> +A transport provides a mechanism for the driver to discover the device.
> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport provides a mechanism for communicating virtqueue
> +configurations between the device and the driver.
> +
> +A transport allows multiple virtqueues per device. The number of
> +virtqueues for a pair of device-driver are governed by the individual
> +device protocol.

Maybe "for a given device/driver pair"?

> +
> +A transport provides a mechanism that the device and the driver use to
> +access memory for implementing virtqueues.
> +
> +A transport provides a mechanism for the device to notify the driver and
> +a mechanism for the driver to notify the device, for example regarding
> +availability of a buffer on the virtqueue.
> +
> +A transport provides a mechanism for the driver to initiate a reset of
> +the device.
> +
> +A transport provides a mechanism to reset an individual virtqueue.

Is that more of a requirement or a strong suggestion, given that not all
existing transports provide this?

> +
> +A transport provides a mechanism for the driver to read the device
> +status. A transport provides a mechanism for the driver to change the
> +device status.
> +
> +A transport provides a mechanism to implement configuration space
> +between the device and the driver.
> +
> +\section{Device Requirements}\label{sec:Creating New Transports / Device=
 Requirements}
> +
> +The device keeps any data associated with a device-initiated transaction
> +accessible to the driver until the driver acknowledges the transaction
> +to be complete.
> +
> +The device resets itself if requested by the driver, in a transport
> +defined way, if the transport provides such a method.
> +
> +The device resets an individual virtqueue if requested by the driver,
> +in a transport defined way, if the transport provides such a method.
> +
> +\section{Driver Requirements}\label{sec:Creating New Transports / Driver=
 Requirements}
> +
> +The driver acknowledges device notifications, as mandated by the
> +transport.
> +
> +The driver accesses queued buffers after the device has processed them
> +and notified the driver of their availability. This mechanism is
> +transport defined.
> +
> +The driver asks the device to reset itself if, for example, the driver
> +times out waiting for a notification from the device for a previously
> +queued request.
> +
> +The driver asks the device to reset an individual virtqueue.

This sentence is a bit weird, like the driver would randomly decide to
reset a virtqueue :) Can we qualify this a bit?

