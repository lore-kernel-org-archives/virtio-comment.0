Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08A1A4F0B
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083315; cv=none; b=jYY4wW9+UIBHZoG216VpQQMZhAFmmbm+48KIsqRGfVnJ4mMqeZWvdNdVmCWZRN5D5E4Nk9AOVNLtfn+yQmKnd11pPAzIu/+b0xTMvNRR1slTuSwx7wRaq2/2gYVK3+ykNdGcF7RrXWdIl2SsDIxqOusAxRS/mifvlvgBeETtiUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083315; c=relaxed/simple;
	bh=2Kv38EJ/RgQW1vGOGpZZLDp3l0sdKFcSwsQUFoUMt5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IjFoqjOD127M2Vax/avR+a3Y3ZOPPRZVonWA7gOpW52quHEpCh6oPJwwY70NO+bRHfd84zh7LpWNu6op991YvGikEqJ9T+mms0vvjhKclfq74lYeSfhW1PbBM8G/7TcWW+XBe5MGw0onoZWm+O2jEqo6+c5x1Oze+z4LWlwYUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aSNDVWXU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aSNDVWXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720083312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NI3bl09JDWzO7xJaNDh7vxnQvvCcT2zpXPfuVMGeOxo=;
	b=aSNDVWXU/Vp6CElbmsccZEv2iEOBtWMiJB+Hp9ksAg0jsbj7cmQRuhI5shmjes4cMxmfo+
	1t2LGB46638J7cBB3MdXYdwHWmXPHlvnc91Y8DefVrKmq5a7R/Hmq1Frq760qjfTdiXlJ8
	Y23fuhtkqRjZnxpdTdFcPIX/OTrPyHU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-n4eA_5Q5NAuWRmAF5_nufA-1; Thu, 04 Jul 2024 04:55:10 -0400
X-MC-Unique: n4eA_5Q5NAuWRmAF5_nufA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52e9b773505so370697e87.1
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 01:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720083309; x=1720688109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NI3bl09JDWzO7xJaNDh7vxnQvvCcT2zpXPfuVMGeOxo=;
        b=RqVLSyQWumHOrko+Q77nUfPuaigsoUEYszLkvCdnBFFMcFAGCxoM694UjAnoKda85s
         nhl8dCZZnCR2y197c/2nAUqyjV9Cuw36pqxFt+lzLreqlaVlDbOq37X9b0HM0tN6HF0g
         wse9sVY+mW0T2hodHCVN38qlBo2DirtYGz1X4Z0qT7h0Y+crXZHG2mxOULTZBumi00ig
         hTSsFOXF2TtloYyeZ3gnBSZrOMvtcFcWl9PrRwoAqsKjwYf/PrTFJDPhP0KLFzpmstIm
         tJ/LZWdNuRBT/RqJC/kYOgoqGhnhZ3YvH/VQHkmYn4FM4woZ/XnFf/eP58Yb8xvrIl+O
         YCBA==
X-Forwarded-Encrypted: i=1; AJvYcCXrRyAdWkMovGTaH0D9d8PNTTZinJbTRAhPXatr1TOW5jrwjnQ6JAJBIS6DhiMJOr7eZ5O37Yn8lmTcNTIz7k5X+qT1GW9jtBXzWjGECCg=
X-Gm-Message-State: AOJu0YxSIUlpz+aFUVMzUtRwLl+ZAyPYZ/af8lAn57lhqAH+5FN914jo
	+MQhQRaIGEbEtenWXqVZw3rmNfPYcGC3uBeHvqMXy4Nw3sZQuqUuPpYw7bI9tYOV/L+r5bHbwGI
	yCyRCJq21BmmES4+pJiG3/B/4f24GzkRFKDyeNoSyPoV4jQpw/LR3pKAxqOTBntlg
X-Received: by 2002:ac2:4314:0:b0:52c:e012:efad with SMTP id 2adb3069b0e04-52ea0622e1dmr713744e87.12.1720083308842;
        Thu, 04 Jul 2024 01:55:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCn2HuSSkAr70Fc5tBBDp9IQunFBnEqTmb1cbHcjs6VGw3QNawm5UioRA034Vwmvx/yhJ+YQ==
X-Received: by 2002:ac2:4314:0:b0:52c:e012:efad with SMTP id 2adb3069b0e04-52ea0622e1dmr713717e87.12.1720083308092;
        Thu, 04 Jul 2024 01:55:08 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:82e2:c2d2:c800:4b76:dc98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367900fd1e5sm4447154f8f.63.2024.07.04.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 01:55:07 -0700 (PDT)
Date: Thu, 4 Jul 2024 04:55:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@amd.com>,
	jasowang@redhat.com, virtio-comment@lists.linux.dev,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
Message-ID: <20240704044403-mutt-send-email-mst@kernel.org>
References: <20240703031057.37565-1-lingshan.zhu@amd.com>
 <20240703044005-mutt-send-email-mst@kernel.org>
 <CAD=HUj6uxtq2WobmAaOeOk4UR-TeZ0nHL8SeE9MnuDaap5uY+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj6uxtq2WobmAaOeOk4UR-TeZ0nHL8SeE9MnuDaap5uY+A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 04, 2024 at 05:39:32PM +0900, David Stevens wrote:
> On Wed, Jul 3, 2024 at 6:01 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
> > > This commit allows the driver to suspend the device by
> > > introducing a new status bit SUSPEND in device_status.
> > >
> > > This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> > > which indicating whether the device support SUSPEND.
> > >
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> >
> > Your signature would normally be last.
> >
> >
> > > ---
> > >  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
> > >  1 file changed, 61 insertions(+), 10 deletions(-)
> >
> > At a high level, I think this is somewhat overspecified.
> > Generally e.g. if driver is forbidden from accessing
> > a field, then we do not also add specific requirements for
> > devices - with no driver doing this, such functionality will
> > remain untested and unused, and when we finally decide we need
> > it it's not going to be there.
> > Similarly for when device is not touching a field - no
> > reason for driver not to touch it.
> >
> >
> > > diff --git a/content.tex b/content.tex
> > > index 0a62dce..8c974d3 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
> > >      this bit.  For example, under Linux, drivers can be loadable modules.
> > >    \end{note}
> > >
> > > -\item[FAILED (128)] Indicates that something went wrong in the guest,
> > > -  and it has given up on the device. This could be an internal
> > > -  error, or the driver didn't like the device for some reason, or
> > > -  even a fatal error during device operation.
> > > +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> > > +  drive the device.
> > >
> > >  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
> > >    features it understands, and feature negotiation is complete.
> > >
> > > -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> > > -  drive the device.
> > > +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> > > +  device has been suspended by the driver.
> > >
> > >  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
> > >    an error from which it can't recover.
> > > +
> > > +\item[FAILED (128)] Indicates that something went wrong in the guest,
> > > +  and it has given up on the device. This could be an internal
> > > +  error, or the driver didn't like the device for some reason, or
> > > +  even a fatal error during device operation.
> > >  \end{description}
> > >
> > >  The \field{device status} field starts out as 0, and is reinitialized to 0 by
> > > @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
> > >  initialization sequence specified in
> > >  \ref{sec:General Initialization And Device Operation / Device
> > >  Initialization}.
> > > -The driver MUST NOT clear a
> > > -\field{device status} bit.  If the driver sets the FAILED bit,
> > > +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
> > > +except when setting \field{device status} to 0 as a transport-specific way to
> > > +initiate a reset. If the driver sets the FAILED bit,
> > >  the driver MUST later reset the device before attempting to re-initialize.
> > >
> > >  The driver SHOULD NOT rely on completion of operations of a
> > > @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> > >  \begin{description}
> > >  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
> > >
> > > -\item[24 to 41] Feature bits reserved for extensions to the queue and
> > > +\item[24 to 42] Feature bits reserved for extensions to the queue and
> > >    feature negotiation mechanisms
> > >
> > > -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> > > +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
> > >  \end{description}
> > >
> > >  \begin{note}
> > > @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
> > >
> > >  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
> > >
> > > +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
> > > +
> > > +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> > > +SUSPEND bit in \field{device status} to suspend a device, and can
> > > +clear the SUSPEND bit to resume a suspended device.
> > > +
> > > +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> > > +
> > > +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> > > +
> > > +Once the driver sets SUSPEND to \field{device status} of the device:
> > > +\begin{itemize}
> > > +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
> >
> > If it's not set, then what? Device error, have to reset?
> >
> >
> > > +\item The driver MUST NOT make any more buffers available to the device.
> > > +\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.
> >
> > what are these "fields"? the area in memory where the vq lives? why is
> > doing that a problem - you want device to be able to write something
> > there?
> >
> > > +\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
> > > +if it is implemented in the Config Space.
> >
> > what is "the Config Space"? device status is never in
> > a device configuration space, it is part of the common configuration.
> > so what exactly are you forbidding here?
> 
> IIUC, referring to the common configuration here wouldn't make sense.
> The common configuration is part of the PCI transport specification,
> so in this part of the specification it should only be referred to via
> the "transport specific" phrasing.

Good point.  We can easily fix this for MMIO though.

 
MMIO virtio devices provide a set of memory mapped control
registers followed by a device-specific configuration space,
described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.

->

MMIO virtio devices provide memory mapped control
including a set of common configuration
registers followed by a device-specific configuration space,
described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.



Less sure about CCW.
Maybe:

In addition to the basic channel commands, virtio-ccw defines a
set of channel commands related to configuration and operation of
virtio:

\begin{lstlisting}
#define CCW_CMD_SET_VQ 0x13
#define CCW_CMD_VDEV_RESET 0x33
#define CCW_CMD_SET_IND 0x43
#define CCW_CMD_SET_CONF_IND 0x53
#define CCW_CMD_SET_IND_ADAPTER 0x73
#define CCW_CMD_READ_FEAT 0x12
#define CCW_CMD_WRITE_FEAT 0x11
#define CCW_CMD_READ_CONF 0x22
#define CCW_CMD_WRITE_CONF 0x21
#define CCW_CMD_WRITE_STATUS 0x31
#define CCW_CMD_READ_VQ_CONF 0x32
#define CCW_CMD_SET_VIRTIO_REV 0x83
#define CCW_CMD_READ_STATUS 0x72
\end{lstlisting}

->


In addition to the basic channel commands, virtio-ccw defines
channel commands related to configuration and operation of
virtio - a set of commands to access common configuration of
the device:

\begin{lstlisting}
#define CCW_CMD_SET_VQ 0x13
#define CCW_CMD_VDEV_RESET 0x33
#define CCW_CMD_SET_IND 0x43
#define CCW_CMD_SET_CONF_IND 0x53
#define CCW_CMD_SET_IND_ADAPTER 0x73
#define CCW_CMD_READ_FEAT 0x12
#define CCW_CMD_WRITE_FEAT 0x11
#define CCW_CMD_WRITE_STATUS 0x31
#define CCW_CMD_READ_VQ_CONF 0x32
#define CCW_CMD_SET_VIRTIO_REV 0x83
#define CCW_CMD_READ_STATUS 0x72
\end{lstlisting}

and additionally, two commands to access the device
specification configuration space:

\begin{lstlisting}
#define CCW_CMD_READ_CONF 0x22
#define CCW_CMD_WRITE_CONF 0x21
\end{lstlisting}


And now we have common configuration defined for all transports.
Cornelia, WDYT?


> This wording appears to be taken
> from Cornelia's feedback on v5. Specifically:
> 
> > > +\item The driver MUST NOT access Device Configuration Space.
> > ...except for the status field, if it is part of the config space?
> 
> I asked for clarification [1], because Cornelia's feedback seems to
> contradict your feedback here and on the (unfortunately unarchived) v3
> patch. What is the definitive statement agreed upon by both editors of
> the virtio specification as to whether or not the device status field
> is part of the device configuration space?
> 
> [1] https://lore.kernel.org/all/CAD=HUj4RBeLS4L=ehyPGtejeu+sGZ5j8PRtrK8AvxjEgEBd5ZA@mail.gmail.com/
> 
> -David

I don't know what did Cornelia mean. Cornelia?

-- 
MST

