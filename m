Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925016DEB2
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718194265; cv=none; b=Y2aRUpdBD/bR+Db34GHdr7fjBAcgx+xgvmGP5URClLUiMarqeRBFccNGnnzu2VQT0f93Ob2Ne6bIvbiwaPf8yApl1FBpr0OAFDps0ANOwXbS+HdLNPa9HeqsJvU2zg7Jf2lP42iyQo5SSvPRSwW40CMZWgrw2398yNGIBpJlzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718194265; c=relaxed/simple;
	bh=gr4wA/DZf27VgKqI9hL1NvyDSQ5hIEcDUGzMT4b4OYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JMG3jQh8HYINFyEjr8dSMOHbOzgJQFg2HI7nQym0oEd+OiguCbEmO3vE/psgTGLKIxbHz/ohfSQNHqAHkZt2sC4INHp8ATWgsG3+OZYBCOMzRRuONlN78eNlX+gcoBbnuQzrioRiPGE33kyWo8MYm8TioUNcfE/J0JCrkrTgnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/mQ/4Om; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/mQ/4Om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718194259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smjpFe3efK9FcZuD+l9SY5poae4O7YvPwEZBTO4zNi4=;
	b=R/mQ/4Om1SIEzJhT6Ezhxu6bSXfLxFoJT0RH4e3w1H5z+b48hkQhqRnRQOZLoo/1N6dVPU
	m/8M82X0oY2m8wemmF2tBoLhHsA6eOQfDAgLlW/emYN1q+pCZVILiZzgcPrTYJdjqBOi8e
	y3rP4FogFC6nM9eZo0ZFZz7SUTUcN48=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-THZ_e2WhNAyLzbEt7SxC1g-1; Wed, 12 Jun 2024 08:10:57 -0400
X-MC-Unique: THZ_e2WhNAyLzbEt7SxC1g-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52c893408b5so2533342e87.2
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 05:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718194256; x=1718799056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smjpFe3efK9FcZuD+l9SY5poae4O7YvPwEZBTO4zNi4=;
        b=Y/XXt84ve5GpbCMYr3AOVT3gxncfz5lV6dKHneTmJnigkygGAYfoTTKRCsx6sLxH09
         lFnaA/VbcJz+k1P13Y4s2+ngz7EcM47TEzUN4ZXd0vGUoT2oTxHoPTtBOkDRf9QLMtDr
         hup+2KRZtfmzN1moWjMV5ib62khK5Na37jt026d1SK28yK0bsPSnUlOL/AytjGeUNWz+
         yF/Tbm+LABSZxD/vc+5nSbasddg+G3oyM/9FtooMIJjB3ErmJoINiRc9Ch7sekGvQ5l3
         ZEixvzkYKrQMaFlGo9lLXxXTSqdAyUnaTRzPMSMAlGOqhbsnLAv30WG5g/JGqMG2zxxL
         RCsw==
X-Forwarded-Encrypted: i=1; AJvYcCUwEbDuF5Va67X+j1cqpQTP3Bi+XnzuN+uBEUW3+KTvxoPJr8WWOnzQAsddc4PjfWmec3mr+LbDxu0jU4dw/Xksusi5ETDi6df/D7NEH2Q=
X-Gm-Message-State: AOJu0YzbT1y0RKesULX0cGQqZxT/HtSHcKue7rl5NDPGZB2R8MvN3SFM
	AGCNbvdxM04D6BA8f7WRImOlsjfWw0gHmo1EWyE5sHea7byp83YygoubQYOL+bvr9R58Ayshjjo
	blbW1ahO44HhNRUTYL8vswUfo6TeL7G7wIFGUY8LlUI2XK1aIDsT7OeHqMY5kINhl
X-Received: by 2002:a05:6512:694:b0:52c:884f:da49 with SMTP id 2adb3069b0e04-52c9a405450mr1282295e87.61.1718194256217;
        Wed, 12 Jun 2024 05:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxd/xwc8rbvpcnQSaQz+whxxVYHXO5ZV5ttfLcuex4dOF6eRuuwesbbd5WvrsXePRawWiiIg==
X-Received: by 2002:a05:6512:694:b0:52c:884f:da49 with SMTP id 2adb3069b0e04-52c9a405450mr1282253e87.61.1718194255536;
        Wed, 12 Jun 2024 05:10:55 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:39eb:4161:d39d:43e6:41f8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f29116506sm6541898f8f.60.2024.06.12.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:10:54 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:10:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
Message-ID: <20240612080558-mutt-send-email-mst@kernel.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 11, 2024 at 05:17:32AM +0000, Parav Pandit wrote:
> Hi Lingshan, David,
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Monday, June 10, 2024 9:34 PM
> > 
> > On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
> > 
> > > This commit allows the driver to suspend the device by introducing a
> > > new status bit SUSPEND in device_status.
> > >
> > > This commit also introduce a new feature bit VIRTIO_F_SUSPEND which
> > > indicating whether the device support SUSPEND.
> > >
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > ---
> > >  content.tex | 69
> > > +++++++++++++++++++++++++++++++++++++++++++++--------
> > >  1 file changed, 59 insertions(+), 10 deletions(-)
> > 
> > Can you please add a changelog? Especially as some of the previous discussion
> > has been lost due to the broken old mailing lists...
> > 
> > (...)
> > 
> > > +\drivernormative{\subsection}{Device Suspend}{General Initialization
> > > +And Device Operation / Device Suspend}
> > > +
> > > +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
> > VIRTIO_F_SUSPEND is not negotiated.
> > > +
> > > +Once the driver sets SUSPEND to \field{device status} of the device:
> > > +\begin{itemize}
> > > +\item The driver MUST re-read \field{device status} to verify whether the
> > SUSPEND bit is set.
> > > +If not, the device does not support the SUSPEND feature.
> > 
> > That sentence is a bit weird: I'd expect the device to not offer
> > VIRTIO_F_SUSPEND in the first place in that case... could this rather happen if
> > the device is not able to handle the request at a specific point in time?
> > 
> > > +\item The driver MUST NOT make any more buffers available to the device.
> > > +\item The driver MUST NOT access any fields of any virtqueues or notify
> > any virtqueues.
> > 
> > "send notifications for any virtqueues"?
> > 
> > > +\item The driver MUST NOT access Device Configuration Space.
> > 
> > ...except for the status field, if it is part of the config space?
> > 
> > > +\end{itemize}
> > > +
> > > +\devicenormative{\subsection}{Device Suspend}{General Initialization
> > > +And Device Operation / Device Suspend}
> > > +
> > > +The device MUST ignore SUSPEND if FEATURES_OK is not set or
> > VIRTIO_F_SUSPEND is not negotiated.
> > > +
> > > +The device MUST ignore all access to its Configuration Space while
> > > +suspended, except for \field{device status}.
> > 
> > ...if it is part of the configuration space.
> > 
> > > +
> > > +A device MUST NOT send any notifications, access any virtqueues, or
> > > +modify any fields in its configuration space while suspended.
> > > +
> > > +If SUSPEND is set in \field{device status}, when the driver clears
> > > +SUSPEND,
> > 
> > "subsequently clears SUSPEND"?
> > 
> > > +the device MUST either resume normal operation or set
> > DEVICE_NEEDS_RESET.
> > > +
> > > +When the driver sets SUSPEND,
> > > +the device SHOULD perform the following actions before presenting
> > SUSPEND bit in the \field{device status}:
> > > +
> > > +\begin{itemize}
> > > +\item Stop processing more buffers of any virtqueues \item Wait until
> > > +all buffers that are being processed have been used.
> > > +\item Send used buffer notifications to the driver.
> > > +\end{itemize}
> > 
> > So, is there any opportunity for the device to fail setting SUSPEND? I mean, if
> > the driver is supposed to look whether it sticks, there should be conditions for
> > when the device might clear it again...
> > 
> Additionally, a suspend operation usually involves saving things to a slow memory (or media).
> This is because the device implementation wouldn’t know when exactly the device will be resumed.
> Few examples, are:
> a. A gpu device with 128MB of video RAM when suspended, QEMU needs to store this into a (for example) rotating hard disk as 1msec IO latency.
> 
> b. a NIC may need to store its RSS, queues, flow filters configuration for several tens of KBs to some slow memory.
> 
> c. A block device may prefer to complete some IOs to a threshold level instead of maintaining large list of outstanding IOs in some suspended memory.
> 
> d. May be more in future.
> 
> Additionally, suspend operation needs to be synchronized with certain data path hardware engines to suspend DMA operations (read and write both) which are inflight.
> (without causing DMA errors). Same would apply to the sw backend implementations too.
> 
> Therefore, the suspend operation that is initiated by the driver, should get the acknowledgement back from the device that it has been suspend.
> 
> Some of the good examples if you prefer to follow, a driver<->device interface needs a suspend register which should behave like below queue reset register.
> 
> Spec snippet:
> "The device MUST reset the queue when 1 is written to queue_reset. The device MUST continue to present
> 1 in queue_reset as long as the queue reset is ongoing. The device MUST present 0 in both queue_reset
> and queue_enable when queue reset has completed."
> 
> At minimum, we need, something implementable like,
> 
> The device MUST suspend the device when 1 is written to the device_suspend_ctlr. The device MUST continue to present 1 in device_suspend_ctrl as the suspend operation is ongoing in the device.
> The device MUST present 0 in the device_suspend_ctlr register when device has completely suspended the device.
> 
> The device MUST resume the device when 2 is written to the device_suspend_ctrl. The device MUST continue to present 2 in the device_suspend_ctrl as the resume operation may not have yet completed.
> The device MUST present 0 in the device_suspend_ctrl register when the device has completely resumed the device.
> At this point, the driver may resume notifying the device and accessing the configuration space.
> 
> Can you please enhance this part?

Yea, this gives me pause too.


> 
> > > +
> > >  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> > > Options}
> > >
> > >  Virtio can use various different buses, thus the standard is split @@
> > > -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > Feature Bits}
> > >  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
> > for
> > >  	handling features reserved for future use.
> > >
> > > +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> > > +   set SUSPEND to the device.
> > 
> > "that the driver can trigger suspending the device via the SUSPEND flag"?
> > 
> > > +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> > > +
> > >  \end{description}
> > >
> > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> > > Bits}
> > 
> 

