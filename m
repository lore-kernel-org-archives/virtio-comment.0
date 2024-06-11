Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C803B2A2
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123208; cv=none; b=g3l4lYIrkGg8zOgPJuVbwQJ/AwjmEWZomkGHXl+kLW1+itlWM/gsynppcYwdyMjKY7/GZUF4HjQC5/A9dawSxS8hQMpVuQn3z7lyZFn4OQ7t/LqKOmk2kyXAaXRuwhhTSkUQSTSixoU+hxJkHCMsderJcAr5jpGut3VpnrpKp9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123208; c=relaxed/simple;
	bh=z6MdBDUQBtFzXHKgHmVDKD4s0sWcKQUXXrl1Dj5O4N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r36Glvcs1Dlgbx1g6/KHY3Nwsi9+ZSq9+g02CkpY5yopdhkODkWFaLzaSinq3EzS6hu1IFMbHTbsuHsXuLonUFP8DNkELuOI5Jr5VGgzWYdSkUGfDMyc6BBggEhUxfgIhHeBvtcKG6SgXgwXhcLd71SZercWeiN9Wgyqmvf/1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XnqnVSM0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XnqnVSM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718123205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBtTiGBuM5FSk3qzR2Uvbg2wV3jmKTrDG1unwGXN/+o=;
	b=XnqnVSM0Si2UjK5HKnGxWqMuSP64lco2j7nfJyAfeZn6mBnJcy4dHX9pfqhBfAucMaXzm0
	WTSuks68HWzqaQsTfO/FGazKAOuOzdoE/y1ErhNhR88S23pFIXKoj4X3YholpkwNWomYwT
	2YmcQYrhVGUW36v3ev2+sx99SldgpiM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-5vdaz7JbMXOKhn0sTZGpPA-1; Tue, 11 Jun 2024 12:26:43 -0400
X-MC-Unique: 5vdaz7JbMXOKhn0sTZGpPA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-421179fd82bso44325665e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 09:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718123201; x=1718728001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBtTiGBuM5FSk3qzR2Uvbg2wV3jmKTrDG1unwGXN/+o=;
        b=IaxrirxZeBAyZvcmls+FQeIbsoTz5Ys9KydYWIqTK5b7UKErzi7QtepNdZ78/4RbbB
         XQafH6agUHFHfBVDdQQfxoHR6nzQXv8ZupGXxJie2g+COGqEOcLxrMaWJEkohQG7I6TD
         aDCta+NxipS5b48TZUo8GMDpaUjn5wy+nyRD81z1U0HV2AY9KD1djuv6vacp6kZ8Kr4k
         yvo7ZgZOQVnx1srvMzijh0W01mSO1q3L7xwC0oDQ3tOFOFW7kEsGPWUi2Ah+ouuR5Jb3
         vg8+e8hb7wej4In6ybk90Fr+6NEW+k7WNjv261UefBD9yPQS/Oz1fvdaozxlD6awhLaT
         FCMA==
X-Forwarded-Encrypted: i=1; AJvYcCWpMpadqKFQhLKeNYHLFoT6vmOZ4V+A27LmUgaiPBO2ib8AMm6UsIBzlC0nMEGzAGaBkvrrPX4i6ujeGkh18x17qGhs2oTdgzZWzdouS84=
X-Gm-Message-State: AOJu0YwdNyMypeKsVBSgZSVSyamB12WmZx1ugIgzFl646U8S69kcF7mb
	4/FM2NgIi5kQKQFcmQ4uilV4n2PpJ/P5OEAkprN3j0PQi8iZ1Ul4+YODG8h2nIFBoZw2D8NTFBj
	z3MhBcM/LlONXuWuCSQyS3e+Dsb5uUJY6TmjN9d7ChA4e0Bg0XEmdfmPs02iBCOQP
X-Received: by 2002:a05:600c:3502:b0:422:70d4:7e96 with SMTP id 5b1f17b1804b1-42270d480damr10520245e9.15.1718123201542;
        Tue, 11 Jun 2024 09:26:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETCEYs7xvvyougLIFXrN9JlC/1l+51vNGCzICAMnlvcL/iRMjrQVQjhNgCUpyvV2a4lgVRuA==
X-Received: by 2002:a05:600c:3502:b0:422:70d4:7e96 with SMTP id 5b1f17b1804b1-42270d480damr10519955e9.15.1718123200952;
        Tue, 11 Jun 2024 09:26:40 -0700 (PDT)
Received: from redhat.com ([2.52.131.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422683be336sm22257515e9.17.2024.06.11.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 09:26:40 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:26:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Cornelia Huck <cohuck@redhat.com>, jasowang@redhat.com,
	virtio-comment@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
Message-ID: <20240611122132-mutt-send-email-mst@kernel.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <3e7b83f0-541b-4878-a1c5-4405b2a9e075@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3e7b83f0-541b-4878-a1c5-4405b2a9e075@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 11, 2024 at 04:20:42PM +0800, Zhu Lingshan wrote:
> 
> 
> On 6/11/2024 12:04 AM, Cornelia Huck wrote:
> > On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
> >
> >> This commit allows the driver to suspend the device by
> >> introducing a new status bit SUSPEND in device_status.
> >>
> >> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> >> which indicating whether the device support SUSPEND.
> >>
> >> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >> Signed-off-by: David Stevens <stevensd@chromium.org>
> >> ---
> >>  content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
> >>  1 file changed, 59 insertions(+), 10 deletions(-)
> > Can you please add a changelog? Especially as some of the previous
> > discussion has been lost due to the broken old mailing lists...
> >
> > (...)
> will add change log in next version.
> >
> >> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> >> +
> >> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> >> +
> >> +Once the driver sets SUSPEND to \field{device status} of the device:
> >> +\begin{itemize}
> >> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
> >> +If not, the device does not support the SUSPEND feature.
> > That sentence is a bit weird: I'd expect the device to not offer
> > VIRTIO_F_SUSPEND in the first place in that case... could this rather
> > happen if the device is not able to handle the request at a specific
> > point in time?
> Yes, this can be improved
> 
> How about:
> If not, this indicating the device is not able to handle SUSPEND at the moment.


I don't get what this means, agrammatical and vague.
Please make it explicit. Do you mean if driver reads
status and SUSPEND is clear then devide failed to
enter suspend state? Might be problematic: time to 
suspend might be quite high.


> >> +\item The driver MUST NOT make any more buffers available to the device.
> >> +\item The driver MUST NOT access any fields of any virtqueues or notify any virtqueues.
> > "send notifications for any virtqueues"?
> OK
> >
> >> +\item The driver MUST NOT access Device Configuration Space.
> > ...except for the status field, if it is part of the config space?
> Yes, that is the original design, then I am convinced that the status fields is
> not a part of the config space because it has a dedicated section in the spec.
> 
> I will add this sentence in the next version.
> >
> >> +\end{itemize}
> >> +
> >> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> >> +
> >> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> >> +
> >> +The device MUST ignore all access to its Configuration Space while
> >> +suspended, except for \field{device status}.
> > ...if it is part of the configuration space.
> Yes
> >
> >> +
> >> +A device MUST NOT send any notifications, access any virtqueues, or modify
> >> +any fields in its configuration space while suspended.
> >> +
> >> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> > "subsequently clears SUSPEND"?
> I am a native speaker, but "subsequently" sounds like clearing SUSPEND right after "setting SUSPEND", I guess there can be
> some operations during SUSPEND.
> 
> >
> >> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
> >> +
> >> +When the driver sets SUSPEND,
> >> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
> >> +
> >> +\begin{itemize}
> >> +\item Stop processing more buffers of any virtqueues
> >> +\item Wait until all buffers that are being processed have been used.
> >> +\item Send used buffer notifications to the driver.
> >> +\end{itemize}
> > So, is there any opportunity for the device to fail setting SUSPEND? I
> > mean, if the driver is supposed to look whether it sticks, there should
> > be conditions for when the device might clear it again...
> The device should not present SUSPEND bit in the device status until it is suspended,
> so I am afraid there is not a SUSPEND bit to clear if the device fails to suspend itself.
> 
> I think there can be two indications of a failed suspend:
> 1) The driver sets SUSPEND, but the device does not present SUSPEND after a while, depends
> on the driver tolerance, the driver may assume it is a failed SUSPEND, like how we handle FEATURES_OK


This is not how we handle FEATURES_OK.

> 2)The device runs into errors, presenting NEEDS_RESET.
> 

More reasonable.

> >
> >> +
> >>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> >>  
> >>  Virtio can use various different buses, thus the standard is split
> >> @@ -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
> >>  	handling features reserved for future use.
> >>  
> >> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> >> +   set SUSPEND to the device.
> > "that the driver can trigger suspending the device via the SUSPEND flag"?
> Yes
> >
> >> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> >> +
> >>  \end{description}
> >>  
> >>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

