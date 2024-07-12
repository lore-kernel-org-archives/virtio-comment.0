Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBDB15D5B3
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720784671; cv=none; b=cBcyEdsTq9HlhWrqVUc4sENpbKnXKHaOLsCAS8JT0ma0HouA8iguJTd3mWc4SKutYM4ZaxUQmOsR1i+iPH3S3D7khWhgUjNgisV96nBNd/Kz8ZBtA24bIOyMhh0kcHh+/IqsYaNGSEHIB4/jPRwwLhgg1Wf3SY6V8gEjB4EopII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720784671; c=relaxed/simple;
	bh=wi398VqHO5W1lj3/EzxSZFlVE1JolIjrsAiQ29cHOCM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DfCaX0Y+WsAYORe9U4MNYG2qUhpps1iFQ7Vcfy9b52as04m2ML/oyXwQQum91h7PZ+0LWKBizfyxzVhj3Zmg99zBWxF8AGGPxnfpgGEA5jSjNi5XmLhC57psZ3Iek8D/CJ75ecbZ+jkvQ1PGkTfgjEsNWXyWX2D0MFn/9k4PK8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWHtFO8P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWHtFO8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720784667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsZ9qEudjpqwpOF0DGmb4nDBpNRFFvDJBS3yghJEgVU=;
	b=JWHtFO8PIGb8qQ5XQPvFrdp/bDU06wNltcxMIsjWFIl+vWtRG2I90SbW7724wt39GxgDHr
	OsZrfRODmFEozerPKWaQfhpWPgXHOQ/yh9QJWMwneLPMe0cu7i0DV0dM3oq3xHpvMuxtqn
	geUMcCe+rEYDbc+FlMR5KK+iNfqtpIs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-QBxRtq-mPLKw6q3viruAeQ-1; Fri,
 12 Jul 2024 07:44:24 -0400
X-MC-Unique: QBxRtq-mPLKw6q3viruAeQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AD4219792E0;
	Fri, 12 Jul 2024 11:44:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.17])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 557D91955F3B;
	Fri, 12 Jul 2024 11:44:21 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Stevens
 <stevensd@chromium.org>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, jasowang@redhat.com,
 virtio-comment@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>,
 Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
In-Reply-To: <20240704044403-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240703031057.37565-1-lingshan.zhu@amd.com>
 <20240703044005-mutt-send-email-mst@kernel.org>
 <CAD=HUj6uxtq2WobmAaOeOk4UR-TeZ0nHL8SeE9MnuDaap5uY+A@mail.gmail.com>
 <20240704044403-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 12 Jul 2024 13:44:19 +0200
Message-ID: <87frsebzsc.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 04, 2024 at 05:39:32PM +0900, David Stevens wrote:
>> On Wed, Jul 3, 2024 at 6:01=E2=80=AFPM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
>> >
>> > On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
>> > > +\item The driver MUST NOT access Device Configuration Space except =
for the field \field {device status},
>> > > +if it is implemented in the Config Space.
>> >
>> > what is "the Config Space"? device status is never in
>> > a device configuration space, it is part of the common configuration.
>> > so what exactly are you forbidding here?
>>=20
>> IIUC, referring to the common configuration here wouldn't make sense.
>> The common configuration is part of the PCI transport specification,
>> so in this part of the specification it should only be referred to via
>> the "transport specific" phrasing.
>
> Good point.  We can easily fix this for MMIO though.
>
> =20
> MMIO virtio devices provide a set of memory mapped control
> registers followed by a device-specific configuration space,
> described in the table~\ref{tab:Virtio Transport Options / Virtio Over MM=
IO / MMIO Device Register Layout}.
>
> ->
>
> MMIO virtio devices provide memory mapped control
> including a set of common configuration
> registers followed by a device-specific configuration space,
> described in the table~\ref{tab:Virtio Transport Options / Virtio Over MM=
IO / MMIO Device Register Layout}.
>
>
>
> Less sure about CCW.
> Maybe:
>
> In addition to the basic channel commands, virtio-ccw defines a
> set of channel commands related to configuration and operation of
> virtio:
>
> \begin{lstlisting}
> #define CCW_CMD_SET_VQ 0x13
> #define CCW_CMD_VDEV_RESET 0x33
> #define CCW_CMD_SET_IND 0x43
> #define CCW_CMD_SET_CONF_IND 0x53
> #define CCW_CMD_SET_IND_ADAPTER 0x73
> #define CCW_CMD_READ_FEAT 0x12
> #define CCW_CMD_WRITE_FEAT 0x11
> #define CCW_CMD_READ_CONF 0x22
> #define CCW_CMD_WRITE_CONF 0x21
> #define CCW_CMD_WRITE_STATUS 0x31
> #define CCW_CMD_READ_VQ_CONF 0x32
> #define CCW_CMD_SET_VIRTIO_REV 0x83
> #define CCW_CMD_READ_STATUS 0x72
> \end{lstlisting}
>
> ->
>
>
> In addition to the basic channel commands, virtio-ccw defines
> channel commands related to configuration and operation of
> virtio - a set of commands to access common configuration of
> the device:

Hm, I'm not sure whether "common configuration" is the best wording
here; resetting a device, for example, is not something I'd call
configuration. If we don't manage to come up with anything better, I can
live with it, though.

>
> \begin{lstlisting}
> #define CCW_CMD_SET_VQ 0x13
> #define CCW_CMD_VDEV_RESET 0x33
> #define CCW_CMD_SET_IND 0x43
> #define CCW_CMD_SET_CONF_IND 0x53
> #define CCW_CMD_SET_IND_ADAPTER 0x73
> #define CCW_CMD_READ_FEAT 0x12
> #define CCW_CMD_WRITE_FEAT 0x11
> #define CCW_CMD_WRITE_STATUS 0x31
> #define CCW_CMD_READ_VQ_CONF 0x32
> #define CCW_CMD_SET_VIRTIO_REV 0x83
> #define CCW_CMD_READ_STATUS 0x72
> \end{lstlisting}
>
> and additionally, two commands to access the device
> specification configuration space:
>
> \begin{lstlisting}
> #define CCW_CMD_READ_CONF 0x22
> #define CCW_CMD_WRITE_CONF 0x21
> \end{lstlisting}
>
>
> And now we have common configuration defined for all transports.
> Cornelia, WDYT?
>
>
>> This wording appears to be taken
>> from Cornelia's feedback on v5. Specifically:
>>=20
>> > > +\item The driver MUST NOT access Device Configuration Space.
>> > ...except for the status field, if it is part of the config space?
>>=20
>> I asked for clarification [1], because Cornelia's feedback seems to
>> contradict your feedback here and on the (unfortunately unarchived) v3
>> patch. What is the definitive statement agreed upon by both editors of
>> the virtio specification as to whether or not the device status field
>> is part of the device configuration space?
>>=20
>> [1] https://lore.kernel.org/all/CAD=3DHUj4RBeLS4L=3DehyPGtejeu+sGZ5j8PRt=
rK8AvxjEgEBd5ZA@mail.gmail.com/
>>=20
>> -David
>
> I don't know what did Cornelia mean. Cornelia?

What I meant (I think...) was that accessing the status field is fine,
even if it is implemented as part of the config space.

