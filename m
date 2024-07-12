Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370FC7EF09
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720783102; cv=none; b=PGV+gTqnOquMBhgrlEzdaHq5vsDS9Qaba7wJT2sWbt/6j2ZFtqxAthwcxeZ8hwoNDOXp0yQ6scsmPeJg0Y5XLkp0b6N8od3hTYPgXpWEs5FvWerEfKTqt0I51Ctvst1YbamBOr8nTFIdrI269AmNirYR8McapsdCw2rx9+dg9VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720783102; c=relaxed/simple;
	bh=m6brtPhMDnn0RX0P17Tyd87pGsly94Sg63OienupZGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=d7btczo5L4TB+pRgJ1MlqGKyIYCs+eQ2g8TAWvtV31wf0iewyjvkoGI5MuL/4VX61hAIog/wZyinJr0LwLLDZpeF2DStiDij1pbhWZWY6W0cxMn9DUNhlDZ8DLzgDSgYRH0RBkVM7UJq9TokG/gRu3Wsu1MMN60BqdogNLdfSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E0uxGqiP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E0uxGqiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720783098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1W9MU0fNUeqFI8gKVdFfFhfL5nzYtxmuzJN0scyqYwg=;
	b=E0uxGqiPin5RF/J4eC7UAxWBuDc/m5ridH3HUtRYJ7KTKcU1alFVgjOS6VQUpztWvWZWm/
	AYpb5jKgN0PJFZ81TPrpHiUZGv6//r0D7bRG406yDTn7mldbNpcbS4i9sOzfTf5QVAODmB
	AOTvhgrzKh1W/1nU+92dOZYY2M2GrKc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-lFPKrXtvNFy_2MCaiXTwEA-1; Fri, 12 Jul 2024 07:18:16 -0400
X-MC-Unique: lFPKrXtvNFy_2MCaiXTwEA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52e99257918so1911059e87.1
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 04:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720783094; x=1721387894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1W9MU0fNUeqFI8gKVdFfFhfL5nzYtxmuzJN0scyqYwg=;
        b=ovcej5SkTbJiiMm/O6q5uQ3DOfEQeoEKoqDuo5JIxSa0MSYa+xsjHak9iSOQGfObYq
         2PcknJ2xJH/VUPwTk1Xm+PZjua+9BqaL8ZlQYaETVvyCnJn7VJ8wTQPEpiZa6vjIfd3V
         Ju0ryJ6Gw0QxwQ10odGFRT/0dJnMAijT11E4+hcj8iWq1Z/KO7d3ae7tZ52WQrbHKvV1
         xv8GsaojfTrvd2mA3eZa5mpnFP04CE9UPpE4rIu065WuW4Y802v3JuhSVKZcGJ77OJxA
         Tg/kbj0gtiX55eHvHuWway+gr3DZI0YUDtd+Rz4jPPO3VjxtySOBlqtMLGloStX81UsK
         cqUw==
X-Forwarded-Encrypted: i=1; AJvYcCV33X+bOFyd+mTm0NQF1oQ4bV880nYJnhjPtc14Ls2jT6SBSZTixfaUHJOfB8GeE2gCdtSlpvLo+aWD5FIkuPRJh8jnp1hNlR5MnQ01E4E=
X-Gm-Message-State: AOJu0YwnHpW/JGtPUnvsect0f8Iugl1pDej6BlzU5Szap6fh9enf+yUI
	ygVZMkpIaonsV3AH9hF1qywocLZ0sEFqo0ixl9Oi4R4m4vXvfMfFmYxVQcxqPIWwQVGGeNeKsYU
	jCWg7DQK2WK6hUhyNPGVSFKRMb3ofJlJaCufOE1cD0XXVvm69A/biQ9zkNlZIyAp8Wsq8Tdhm
X-Received: by 2002:a05:6512:3c81:b0:52e:8141:1b27 with SMTP id 2adb3069b0e04-52eb99d219amr10812243e87.43.1720783094202;
        Fri, 12 Jul 2024 04:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6kXkEcNOqcSKYF5E4yePPkLicWOUktB2Ipld2b2UGV9Gy3jSN7R2XdaCSDK4uvKcZ21vqWw==
X-Received: by 2002:a05:6512:3c81:b0:52e:8141:1b27 with SMTP id 2adb3069b0e04-52eb99d219amr10812209e87.43.1720783093446;
        Fri, 12 Jul 2024 04:18:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2d74c6sm20155445e9.45.2024.07.12.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 04:18:12 -0700 (PDT)
Date: Fri, 12 Jul 2024 07:18:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: David Stevens <stevensd@chromium.org>,
	Cornelia Huck <cohuck@redhat.com>, jasowang@redhat.com,
	virtio-comment@lists.linux.dev,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
Message-ID: <20240712071534-mutt-send-email-mst@kernel.org>
References: <20240703031057.37565-1-lingshan.zhu@amd.com>
 <20240703044005-mutt-send-email-mst@kernel.org>
 <CAD=HUj6uxtq2WobmAaOeOk4UR-TeZ0nHL8SeE9MnuDaap5uY+A@mail.gmail.com>
 <20240704044403-mutt-send-email-mst@kernel.org>
 <c1fd18ac-a677-45b6-b643-9fd42ef14722@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c1fd18ac-a677-45b6-b643-9fd42ef14722@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jul 12, 2024 at 05:04:48PM +0800, Zhu Lingshan wrote:
> On 7/4/2024 4:55 PM, Michael S. Tsirkin wrote:
> 
> > On Thu, Jul 04, 2024 at 05:39:32PM +0900, David Stevens wrote:
> >> On Wed, Jul 3, 2024 at 6:01 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>> On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
> >>>> This commit allows the driver to suspend the device by
> >>>> introducing a new status bit SUSPEND in device_status.
> >>>>
> >>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> >>>> which indicating whether the device support SUSPEND.
> >>>>
> >>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Signed-off-by: David Stevens <stevensd@chromium.org>
> >>> Your signature would normally be last.
> >>>
> >>>
> >>>> ---
> >>>>  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
> >>>>  1 file changed, 61 insertions(+), 10 deletions(-)
> >>> At a high level, I think this is somewhat overspecified.
> >>> Generally e.g. if driver is forbidden from accessing
> >>> a field, then we do not also add specific requirements for
> >>> devices - with no driver doing this, such functionality will
> >>> remain untested and unused, and when we finally decide we need
> >>> it it's not going to be there.
> >>> Similarly for when device is not touching a field - no
> >>> reason for driver not to touch it.
> >>>
> >>>
> >>>> diff --git a/content.tex b/content.tex
> >>>> index 0a62dce..8c974d3 100644
> >>>> --- a/content.tex
> >>>> +++ b/content.tex
> >>>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>      this bit.  For example, under Linux, drivers can be loadable modules.
> >>>>    \end{note}
> >>>>
> >>>> -\item[FAILED (128)] Indicates that something went wrong in the guest,
> >>>> -  and it has given up on the device. This could be an internal
> >>>> -  error, or the driver didn't like the device for some reason, or
> >>>> -  even a fatal error during device operation.
> >>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> >>>> +  drive the device.
> >>>>
> >>>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
> >>>>    features it understands, and feature negotiation is complete.
> >>>>
> >>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> >>>> -  drive the device.
> >>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> >>>> +  device has been suspended by the driver.
> >>>>
> >>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
> >>>>    an error from which it can't recover.
> >>>> +
> >>>> +\item[FAILED (128)] Indicates that something went wrong in the guest,
> >>>> +  and it has given up on the device. This could be an internal
> >>>> +  error, or the driver didn't like the device for some reason, or
> >>>> +  even a fatal error during device operation.
> >>>>  \end{description}
> >>>>
> >>>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
> >>>> @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>  initialization sequence specified in
> >>>>  \ref{sec:General Initialization And Device Operation / Device
> >>>>  Initialization}.
> >>>> -The driver MUST NOT clear a
> >>>> -\field{device status} bit.  If the driver sets the FAILED bit,
> >>>> +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
> >>>> +except when setting \field{device status} to 0 as a transport-specific way to
> >>>> +initiate a reset. If the driver sets the FAILED bit,
> >>>>  the driver MUST later reset the device before attempting to re-initialize.
> >>>>
> >>>>  The driver SHOULD NOT rely on completion of operations of a
> >>>> @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> >>>>  \begin{description}
> >>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
> >>>>
> >>>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> >>>> +\item[24 to 42] Feature bits reserved for extensions to the queue and
> >>>>    feature negotiation mechanisms
> >>>>
> >>>> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> >>>> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
> >>>>  \end{description}
> >>>>
> >>>>  \begin{note}
> >>>> @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
> >>>>
> >>>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
> >>>>
> >>>> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
> >>>> +
> >>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> >>>> +SUSPEND bit in \field{device status} to suspend a device, and can
> >>>> +clear the SUSPEND bit to resume a suspended device.
> >>>> +
> >>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> >>>> +
> >>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> >>>> +
> >>>> +Once the driver sets SUSPEND to \field{device status} of the device:
> >>>> +\begin{itemize}
> >>>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
> >>> If it's not set, then what? Device error, have to reset?
> >>>
> >>>
> >>>> +\item The driver MUST NOT make any more buffers available to the device.
> >>>> +\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.
> >>> what are these "fields"? the area in memory where the vq lives? why is
> >>> doing that a problem - you want device to be able to write something
> >>> there?
> >>>
> >>>> +\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
> >>>> +if it is implemented in the Config Space.
> >>> what is "the Config Space"? device status is never in
> >>> a device configuration space, it is part of the common configuration.
> >>> so what exactly are you forbidding here?
> >> IIUC, referring to the common configuration here wouldn't make sense.
> >> The common configuration is part of the PCI transport specification,
> >> so in this part of the specification it should only be referred to via
> >> the "transport specific" phrasing.
> > Good point.  We can easily fix this for MMIO though.
> >
> >  
> > MMIO virtio devices provide a set of memory mapped control
> > registers followed by a device-specific configuration space,
> > described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.
> >
> > ->
> >
> > MMIO virtio devices provide memory mapped control
> > including a set of common configuration
> > registers followed by a device-specific configuration space,
> > described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.
> IMHO this may be a bit vague, PCI as a section about common configuration and a struct "struct virtio_pci_common_cfg "
> listed all contents. But what does CCW/MMIO common configuration contains? Shall we add new sections for them?

I think it's clear: everything that is not device-specific is common,
and we have a table documenting that.

And again CCW does not have registers, it has commands.
And below I suggested listing the common configuration commands.

> >
> >
> >
> > Less sure about CCW.
> > Maybe:
> >
> > In addition to the basic channel commands, virtio-ccw defines a
> > set of channel commands related to configuration and operation of
> > virtio:
> >
> > \begin{lstlisting}
> > #define CCW_CMD_SET_VQ 0x13
> > #define CCW_CMD_VDEV_RESET 0x33
> > #define CCW_CMD_SET_IND 0x43
> > #define CCW_CMD_SET_CONF_IND 0x53
> > #define CCW_CMD_SET_IND_ADAPTER 0x73
> > #define CCW_CMD_READ_FEAT 0x12
> > #define CCW_CMD_WRITE_FEAT 0x11
> > #define CCW_CMD_READ_CONF 0x22
> > #define CCW_CMD_WRITE_CONF 0x21
> > #define CCW_CMD_WRITE_STATUS 0x31
> > #define CCW_CMD_READ_VQ_CONF 0x32
> > #define CCW_CMD_SET_VIRTIO_REV 0x83
> > #define CCW_CMD_READ_STATUS 0x72
> > \end{lstlisting}
> >
> > ->
> >
> >
> > In addition to the basic channel commands, virtio-ccw defines
> > channel commands related to configuration and operation of
> > virtio - a set of commands to access common configuration of
> > the device:
> >
> > \begin{lstlisting}
> > #define CCW_CMD_SET_VQ 0x13
> > #define CCW_CMD_VDEV_RESET 0x33
> > #define CCW_CMD_SET_IND 0x43
> > #define CCW_CMD_SET_CONF_IND 0x53
> > #define CCW_CMD_SET_IND_ADAPTER 0x73
> > #define CCW_CMD_READ_FEAT 0x12
> > #define CCW_CMD_WRITE_FEAT 0x11
> > #define CCW_CMD_WRITE_STATUS 0x31
> > #define CCW_CMD_READ_VQ_CONF 0x32
> > #define CCW_CMD_SET_VIRTIO_REV 0x83
> > #define CCW_CMD_READ_STATUS 0x72
> > \end{lstlisting}
> >
> > and additionally, two commands to access the device
> > specification configuration space:
> >
> > \begin{lstlisting}
> > #define CCW_CMD_READ_CONF 0x22
> > #define CCW_CMD_WRITE_CONF 0x21
> > \end{lstlisting}
> >
> >
> > And now we have common configuration defined for all transports.
> > Cornelia, WDYT?
> >
> >
> >> This wording appears to be taken
> >> from Cornelia's feedback on v5. Specifically:
> >>
> >>>> +\item The driver MUST NOT access Device Configuration Space.
> >>> ...except for the status field, if it is part of the config space?
> >> I asked for clarification [1], because Cornelia's feedback seems to
> >> contradict your feedback here and on the (unfortunately unarchived) v3
> >> patch. What is the definitive statement agreed upon by both editors of
> >> the virtio specification as to whether or not the device status field
> >> is part of the device configuration space?
> >>
> >> [1] https://lore.kernel.org/all/CAD=HUj4RBeLS4L=ehyPGtejeu+sGZ5j8PRtrK8AvxjEgEBd5ZA@mail.gmail.com/
> >>
> >> -David
> > I don't know what did Cornelia mean. Cornelia?
> >

