Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3E1DFF7
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718035480; cv=none; b=B7K7NvLzfW3WHqMHT4NzOkCeyuouRpAIzFemaBPO5EcnIO7pitkR71XlqeOIGH1NHT8oA8Mo5tnA4yJy9Rs5oAuvkgAcOOFxPCvV4sNiVMujWE0Da0BSAtF46sJaLgKfSrL2chw/tkukvXne2nwCZDCM0xnjwTCynFO0IqvFB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718035480; c=relaxed/simple;
	bh=4oZbB7Pe3sibJJ9W5AyxzfyaWmBtZvzl/8nC3qls5sc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gmu72swaFBuvEh4dpMBMvxp8+oZ8v3hN6r7O2jOMueitixzZTQfUXIllm2HOH/OHNsPUmNTEISlclX9FrvEHB/eecf3/yd21cao/VKqkPeaRVtuREN4VOwmJDDATg1/LKAywDqEBr8gCmR35nX1j/kGPf5PoCRBlZKSWrDikJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VOueSTE5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VOueSTE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718035477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RBsjp600Jbcf8cAFbjrpT5UMn6FCU3mRdIc4FQAAoo=;
	b=VOueSTE537U+4ZitqoMTrAd9v7yoZEtIpRfFcY4BH6FRXRCvjw+cWagZQjg0T8Ko+aShL8
	4u+4WK5yc/xORbze1G+sPlnpDqCVLdcfKiExE3/xB/1lfCKu9WDaw6m/0J1eBzwfpnRQxw
	me9Eb9xOvNHTK7BwPBytN18uHNImDfo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-yv9Pl_dPONKlEqFm6OHArQ-1; Mon,
 10 Jun 2024 12:04:34 -0400
X-MC-Unique: yv9Pl_dPONKlEqFm6OHArQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6B3F19560BC;
	Mon, 10 Jun 2024 16:04:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.17])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71A953000224;
	Mon, 10 Jun 2024 16:04:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, mst@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.linux.dev, Zhu Lingshan <lingshan.zhu@amd.com>,
 Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>, David Stevens
 <stevensd@chromium.org>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
In-Reply-To: <20240607074246.7647-1-lingshan.zhu@amd.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 10 Jun 2024 18:04:29 +0200
Message-ID: <87zfrskcmq.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:

> This commit allows the driver to suspend the device by
> introducing a new status bit SUSPEND in device_status.
>
> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> which indicating whether the device support SUSPEND.
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 59 insertions(+), 10 deletions(-)

Can you please add a changelog? Especially as some of the previous
discussion has been lost due to the broken old mailing lists...

(...)

> +\drivernormative{\subsection}{Device Suspend}{General Initialization And=
 Device Operation / Device Suspend}
> +
> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SU=
SPEND is not negotiated.
> +
> +Once the driver sets SUSPEND to \field{device status} of the device:
> +\begin{itemize}
> +\item The driver MUST re-read \field{device status} to verify whether th=
e SUSPEND bit is set.
> +If not, the device does not support the SUSPEND feature.

That sentence is a bit weird: I'd expect the device to not offer
VIRTIO_F_SUSPEND in the first place in that case... could this rather
happen if the device is not able to handle the request at a specific
point in time?

> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT access any fields of any virtqueues or notify =
any virtqueues.

"send notifications for any virtqueues"?

> +\item The driver MUST NOT access Device Configuration Space.

...except for the status field, if it is part of the config space?

> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization And=
 Device Operation / Device Suspend}
> +
> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUS=
PEND is not negotiated.
> +
> +The device MUST ignore all access to its Configuration Space while
> +suspended, except for \field{device status}.

...if it is part of the configuration space.

> +
> +A device MUST NOT send any notifications, access any virtqueues, or modi=
fy
> +any fields in its configuration space while suspended.
> +
> +If SUSPEND is set in \field{device status}, when the driver clears SUSPE=
ND,

"subsequently clears SUSPEND"?

> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET=
.
> +
> +When the driver sets SUSPEND,
> +the device SHOULD perform the following actions before presenting SUSPEN=
D bit in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop processing more buffers of any virtqueues
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}

So, is there any opportunity for the device to fail setting SUSPEND? I
mean, if the driver is supposed to look whether it sticks, there should
be conditions for when the device might clear it again...

> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> =20
>  Virtio can use various different buses, thus the standard is split
> @@ -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}
>  =09\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bi=
ts} for
>  =09handling features reserved for future use.
> =20
> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> +   set SUSPEND to the device.

"that the driver can trigger suspending the device via the SUSPEND flag"?

> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Fiel=
d}.
> +
>  \end{description}
> =20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

