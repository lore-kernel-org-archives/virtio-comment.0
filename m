Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025086;
	b=UXcwEc/nW08ANq4A0ABTuzM1E2BPQgsPkHzj8jLFeAltW3wD9m+oZPKBWMrPK+ju/MIg
	 em66kqgW+AizlyhehnkVtQd/3Fp2xxY3F2YRG4jyDDnVv6wsLVk7q+fyhuvk/khMm5yX5
	 N6fnUizm4u6iS02cqe/9QNDTx0S4hVQFOYqLpEWkqq6phvPwNoK5GMIgUAuUVKvC9SPMI
	 7MrfxBLKmowhRymL9BOvSxX5niGJ8atZO5m5mo4wyG0mrqZga866xahP9RP9uFfuYUou7
	 +vJBniI+DrSc8ZD3lcd/w6xgYACntHLbTYeN6HrYG2EtjdVDSnxsE3z98rTux7zT3vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025086;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:User-Agent:Date:Message-ID:
	 MIME-Version:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=D/HZ82idhkY+a3qdL0a5AS+tZ+O02JF5h/gxn5DNKbY=;
	b=LST270N2EbnJ8CCoGDqLtM6gQrfjmqRIxx/Lr+09k1RUQwE6t8wTwwGBnREQb18/1seC
	 plbM66Mlc4F37WlslemdpQigh4O1X01yDpkDzpqYiJO5OiS6o7UYm7Q2JN8rtNLkliXft
	 vdOZMPB7VmtQ20jKBECUzkBe9uBtbJtGKoF0fGAbo+e6WstQcMoHctzYl8IrFJrd14dQM
	 uBDxuP51MgUDxVohJiVQK71oSVP6pV4tGq9t/6vE25XbnK37pyuYQzUWWOxyURcSGiqmL
	 4FnumbruZEvzzKUAcomrgO/+4VGPPrF6oxOkSF9hNnSjz5t+kXnaXkp0NKwA196cfgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QBCUhO91;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47AE606A31A
	for <virtio-comment@lists.linux.dev>; Mon, 26 Oct 2026 14:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E47AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QBCUhO91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793025084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D/HZ82idhkY+a3qdL0a5AS+tZ+O02JF5h/gxn5DNKbY=;
	b=QBCUhO91NLJeIQyQCGNQBRWqopCytf5T7Ja80RcOZHPZMNMM4Yc7C2N7hmC9ddu4aD5FMb
	4HnLoAb/29x5+I7OVPSxz5mlHaq+5IDohvTDKN24z0M47oW7kOw4N38BecOHz/SghW1hw1
	86fOCh0D3uOJCf0F199fB0E1x2TG7aM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-23qE19ejMKeSER2ahoYkhA-1; Mon,
 26 Oct 2026 10:31:21 -0400
X-MC-Unique: 23qE19ejMKeSER2ahoYkhA-1
X-Mimecast-MFC-AGG-ID: 23qE19ejMKeSER2ahoYkhA_1793025079
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88FCF19560B8;
	Mon, 26 Oct 2026 14:31:19 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 412DB1956086;
	Mon, 26 Oct 2026 14:31:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>, Demi Marie Obenour
 <demiobenour@gmail.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jan
 Kiszka <jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
In-Reply-To: <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Mon, 26 Oct 2026 15:31:16 +0100
Message-ID: <875wyo3557.fsf@redhat.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g0b9rbBioJHsenFeMQLqNcG-W9uucLORrSZKpDQ3mQE_1793025079
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, Oct 23 2026, Peter Hilber <peter.hilber@oss.qualcomm.com> wrote:

> Qualcomm's intent is to upstream a Linux kernel Virtio driver for a
> non-standardized device using a Virtio transport [1]. It should be able
> to work in a vanilla Linux kernel. I think this requires a new
> "vendor-specific" or similar device. The driver needs to avoid
> collisions with other devices and must not take an unassigned ID.
>
> I think "vendor-specific" does not capture all possible use cases for
> such a device, though. It could be a "self-assigned" device, e.g. for
> prototypes to be standardized later.
>
> In the discussion, it was proposed to distinguish "vendor-specific"
> devices through common configuration space fields. I would suggest to
> use a UUID at the start of the configuration space of the new device 52
> to distinguish "vendor-specific"/"self-assigned" devices. Everybody can
> generate a UUID when needed. This would
>
> - allow everybody to create new devices without ID collisions due to
>   using unregistered IDs
>
> - allow using UUIDs for prototyping, with a new one available for each
>   breaking change

I would prefer to have a namespace for this kind of experimentation,
i.e. <testing prefix><uuid>, with vendor or purpose-specific devices
using <vendor/purpose prefix><uuid>, so that...

>
> - be a way to resolve the device ID scarcity

...this would still hold (I think the most limiting factor for this is
actually ccw? not sure how much we care about implementing new devices
on ccw, though), and...

>
> - relieve Virtio TC from some device ID registration work.

...this would also still somewhat hold (no need to reserve an ID for
everything, but if you're serious, get a vendor-or-purpose prefix.)
I'd still want to encourage everyone creating a serious device to go and
try to standardize it.

