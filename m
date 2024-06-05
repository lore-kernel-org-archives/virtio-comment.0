Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2095719AA41
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590124; cv=none; b=SU6TpcwpFQ5uySM51JqpSKg5ADu3TYtm+RJaaMi0qhE81fbzLB6HAPU6J7gjYEg9CVi3ivJYgW4ymZ4mhbdhDOkDPbKZFY7Ksf1JNXLd80vXCQ0nTmt6Nuzl86slLWZYTOemC5aSV0bpzt07A1ZecQvnRILwB6maP1GIW1e7E3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590124; c=relaxed/simple;
	bh=FeFPjpN//ge6ljyRLNbfB+9D8tERrOIzL3rVGV2UsO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ufs8S0i5ZuqD4Tke+ROv819FfJ2v7R+7VE3qLGJP5r2AmXNznSgQO+dGXt/QbaJA98pdzRvmLcR6AjYOBjnhJ3usKwaLvyvcVXej7P7+4DYr015a5C8UuiiqhGU4kZLQDcueoL3tpEJjrh/L1/tlfYywDXaUeyVDgy65se+P4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WkDt/uWy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WkDt/uWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717590122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j84AEoVha6HOAbgvZvJ2BtWKv9sl5j41jYYwKyE3EIU=;
	b=WkDt/uWyoYEgI/B/qgMmteNkDVvE5naZF9NXB/ynQdcai0362fZkr5/+S19DRmmY0b2lmf
	YgD8thpNBylYp4vUQ2KZU0GCRpQLqTu5A41laS3vPRLCJTh/81h5K7h2X/Z8Ijn64cUFpj
	ZB3557F0pfzT0jVUQgjQEp06rDoHPMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-96-BynOhOI25k2FIFERGrg-1; Wed, 05 Jun 2024 08:21:56 -0400
X-MC-Unique: 96-BynOhOI25k2FIFERGrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8011F185B920;
	Wed,  5 Jun 2024 12:21:56 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 002F5C15970;
	Wed,  5 Jun 2024 12:21:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V4] virtio-transport: Clarify requirements
In-Reply-To: <19a5f63c2d88f88f76f5cfc94793aa182d1eeb7f.1717492057.git.viresh.kumar@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <19a5f63c2d88f88f76f5cfc94793aa182d1eeb7f.1717492057.git.viresh.kumar@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 05 Jun 2024 14:21:54 +0200
Message-ID: <87plsvlgv1.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> The virtio documentation currently doesn't define any generic
> requirements that are applicable to all transports. They can be useful
> while adding support for a new transport.
>
> This commit tries to define the same.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
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
>  content.tex | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 78 insertions(+), 2 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index 0a62dce5f65f..23eea890d9b7 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -631,8 +631,84 @@ \section{Device Cleanup}\label{sec:General Initializ=
ation And Device Operation /
> =20
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> =20
> -Virtio can use various different buses, thus the standard is split
> -into virtio general and bus-specific sections.
> +Devices and drivers can use different transport methods to enable
> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> +methods define various aspects of the communication between the device
> +and the driver, like device discovery, exchanging capabilities,
> +interrupt handling, data transfer, etc. For example, in a host/guest
> +architecture, the host might expose a device to the guest on a PCI bus,
> +and the guest will use a PCI-specific driver to interact with it.
> +
> +The standard contains sections describing the transport-agnostic parts
> +of virtio, and sections describing how individual transports implement
> +virtio.
> +
> +\section{Virtio Transport Requirements}\label{sec:Virtio Transport Optio=
ns / Virtio Transport Requirements}
> +

It might be useful to put some kind of lead-in here, maybe something
like

"There are some mechanisms that any transport is required to implement,
and some requirements that devices and drivers are required to follow."

> +\subsection{Transport Requirements}\label{sec:Virtio Transport Options /=
 Virtio Transport Requirements / Transport Requirements}
> +
> +The transport provides a mechanism for the driver to discover the
> +device.

Maybe "A transport", or "Any transport"? I think "The transport" is a
bit awkward if we're not talking about a specific transport, but
something any transport is supposed to do.

> +
> +The transport provides a mechanism for the driver to identify the device
> +type.
> +
> +The transport provides a mechanism for communicating virtqueue
> +configurations between the device and the driver.
> +
> +The transport allows multiple virtqueues per device. The number of
> +virtqueues for a pair of device-driver are governed by the individual
> +device protocol.
> +
> +The transport provides a mechanism that the device and the driver use to
> +access memory for implementing virtqueues.
> +
> +The transport provides a mechanism for the device to notify the driver
> +and a mechanism for the driver to notify the device, for example
> +regarding availability of a buffer on the virtqueue.
> +
> +The transport provides a mechanism for the driver to initiate a reset
> +of the virtqueues and device.
> +
> +The transport provides a mechanism for the driver to read the device
> +status. The transport MUST provide a mechanism for the driver to change

s/MUST provide/provides/

> +the device status.
> +
> +The transport provides a mechanism to implement configuration space
> +between the device and the driver.
> +
> +\subsection{Device Requirements}\label{sec:Virtio Transport Options / Vi=
rtio Transport Requirements / Device Requirements}
> +
> +The device keeps any data associated with a device-initiated transaction
> +accessible to the driver until the driver acknowledges the transaction
> +to be complete.
> +
> +The device doesn't access the contents of a virtqueue before the driver
> +notifies, in a transport defined way, the device that the virtqueue is
> +ready to be accessed.
> +
> +The device doesn't access or modify buffers on a virtqueue after it has
> +notified the driver about their availability.
> +
> +The device resets itself and the virtqueues if requested by the driver, =
in a
> +transport defined way, if the transport provides such a method.
> +
> +\subsection{Driver Requirements}\label{sec:Virtio Transport Options / Vi=
rtio Transport Requirements / Driver Requirements}
> +
> +The driver acknowledges device notifications, as mandated by the
> +transport.
> +
> +The driver doesn't access virtqueue contents before the device notifies
> +about the readiness of the same.
> +
> +The driver accesses queued buffers after the device has processed them
> +and notified the driver of their availability. This mechanism is
> +transport defined.
> +
> +The driver asks the device to reset itself and the virtqueues if, for
> +example, the driver times out waiting for a notification from the device
> +for a previously queued request.
> +
> =20
>  \input{transport-pci.tex}
>  \input{transport-mmio.tex}

