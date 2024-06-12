Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2AF167261
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195013; cv=none; b=rt59M5TrY/Qc27XW4fbr265VK7NOGjq+KvY0TtTr7Vc3STxzxEKIZ04P1F8PRTBif/adnmcmOMYfDaMxcRUF0HqXn6RAnU1b+0SVpq/nHAweSSwk2pE9Z6VdchPcYDqByBvufrSpztF271YqnUOAdUvPpgVpJiTfv+jPSETL1Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195013; c=relaxed/simple;
	bh=RlfIrb6BQyKdxA/ZypyO7w9b0vcESad5KljSMsA9Bzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gJ05t8aVU5CYxscWdVOyXQ4j4SO84P/jE3nZgy5ggFf9ihWoXBayGXpDFVQFa6YwLctM9LrEmUJg4C3DhHjhfnxbE3d/9Piym5SuXTHUn3vo59q5H2DM5lqDdObQ46VbtSVBkkRAvMZIRgno+NszRMCfSYccsvjBlV5g/ZbrMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KuMJ5Dgy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KuMJ5Dgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718195010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PdzBGLvrrxci10HIPotHVoTIBoG+XWs8478Qn9OtSp0=;
	b=KuMJ5Dgy1MmjuKgbGuU3oYtliR1lFX4+ycUgxkl1YuAwRb/vBVaAdNr26yjb0SYCx3G1aG
	G287Wz8csIkI3vK40RsNuKVAtNOhlspTQ3leU0ZLk0AEFT3JXOkEeaJJDQwrzZHsSOrk5h
	TJayvq38Ruyt3uXA9hNvQnD09H7D+Ng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-qioNZxAWOdeidaZ_G1ZdEw-1; Wed, 12 Jun 2024 08:23:29 -0400
X-MC-Unique: qioNZxAWOdeidaZ_G1ZdEw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42183fdd668so22316265e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 05:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718195008; x=1718799808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdzBGLvrrxci10HIPotHVoTIBoG+XWs8478Qn9OtSp0=;
        b=Wr57U7RRp7WyLFqElGhcVTeq0O40/8LJKvYTpiGdrQ8qSoGopP4DuAOMuI16VNGH2+
         /IKVjglJTMkMXQJUnG5N6p/W6Ty/gpeNh8ukYYeE3tpasVePnQAvM0GF0czvUkfZ486F
         8C7LyBZ0BcTjgJcKDqyAp126DNAZ0+rk8zfS4r1bmBgUKNcEHxAmZoW8qHk+yo7t0xN/
         O9afgYhY3V0wx1Lyb6tj6aDZnsFmUvijNruPn54y/OScjllyDgEFB9Mo27AO4zKLx718
         OPi1/cdBaXwObvNWE0X3uveR1zqagSLZS8+ZPnW7CGQPJ39FUrJJOsPbnEk6tyhbBYSv
         DcMw==
X-Forwarded-Encrypted: i=1; AJvYcCX04KPZ4Cr+9521FwQqSaD4efbafA3EeyX8IHo9W0VakxQVB+nGFEM1KuJs6jnqw6Yq9sAybnfzGlDnNJsKkICY0gk8gBX6kLSW/8nj3LQ=
X-Gm-Message-State: AOJu0Yw8uAReOJrhCI8j48vAwXkxZYp+Ta+TnPAbY3YZDvX7nxDBTzuu
	GSBxuofb3zqpvnUUd8MbhYx2nsAtCOEipNOhMSSdKUgM1QB9SLxR90o+1BnyvANCgulG9Qw8hKw
	7J3jJGxZ/H4matkMUy9sN904+KM2RQDJyBVUZdWq/bI0fJwrTpRpWhYHfrYSMyf3a
X-Received: by 2002:a05:600c:154e:b0:41d:d406:9416 with SMTP id 5b1f17b1804b1-422866c53f7mr14368605e9.34.1718195007859;
        Wed, 12 Jun 2024 05:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHckNfhYNn8vfFjzqbQGi63S7X2u3ZY6PuUGzksnVDx+mwzG5tWPWKPbdf8Xy2fcv0Rq00dvQ==
X-Received: by 2002:a05:600c:154e:b0:41d:d406:9416 with SMTP id 5b1f17b1804b1-422866c53f7mr14368355e9.34.1718195007337;
        Wed, 12 Jun 2024 05:23:27 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:39eb:4161:d39d:43e6:41f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ebf7bsm25145355e9.36.2024.06.12.05.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:23:26 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:23:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Cornelia Huck <cohuck@redhat.com>, jasowang@redhat.com,
	virtio-comment@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
Message-ID: <20240612082055-mutt-send-email-mst@kernel.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <3e7b83f0-541b-4878-a1c5-4405b2a9e075@amd.com>
 <20240611122132-mutt-send-email-mst@kernel.org>
 <4e53d29a-9a69-41a5-a91e-1b66db6697d9@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4e53d29a-9a69-41a5-a91e-1b66db6697d9@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jun 12, 2024 at 05:53:56PM +0800, Zhu Lingshan wrote:
> 
> 
> On 6/12/2024 12:26 AM, Michael S. Tsirkin wrote:
> > On Tue, Jun 11, 2024 at 04:20:42PM +0800, Zhu Lingshan wrote:
> >>
> >> On 6/11/2024 12:04 AM, Cornelia Huck wrote:
> >>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
> >>>
> >>>> This commit allows the driver to suspend the device by
> >>>> introducing a new status bit SUSPEND in device_status.
> >>>>
> >>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> >>>> which indicating whether the device support SUSPEND.
> >>>>
> >>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >>>> Signed-off-by: David Stevens <stevensd@chromium.org>
> >>>> ---
> >>>>  content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
> >>>>  1 file changed, 59 insertions(+), 10 deletions(-)
> >>> Can you please add a changelog? Especially as some of the previous
> >>> discussion has been lost due to the broken old mailing lists...
> >>>
> >>> (...)
> >> will add change log in next version.
> >>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> >>>> +
> >>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> >>>> +
> >>>> +Once the driver sets SUSPEND to \field{device status} of the device:
> >>>> +\begin{itemize}
> >>>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
> >>>> +If not, the device does not support the SUSPEND feature.
> >>> That sentence is a bit weird: I'd expect the device to not offer
> >>> VIRTIO_F_SUSPEND in the first place in that case... could this rather
> >>> happen if the device is not able to handle the request at a specific
> >>> point in time?
> >> Yes, this can be improved
> >>
> >> How about:
> >> If not, this indicating the device is not able to handle SUSPEND at the moment.
> >
> > I don't get what this means, agrammatical and vague.
> > Please make it explicit. Do you mean if driver reads
> > status and SUSPEND is clear then devide failed to
> > enter suspend state? Might be problematic: time to 
> > suspend might be quite high.
> I think this is a common problem how the driver handle changes of the device status.
> Even without this SUSPEND feature, spec section 3.1.1 Driver Requirements: Device Initialization says:
> “Re-read device status to ensure the FEATURES_OK bit is still set: otherwise, the device does not support our subset of features and the device is unusable”
> Other status changing may also be costly, so how long should the driver wait for the device responding to status changes?

The driver does not wait with FEATURES_OK. It does a single write
followed by a single read. If it sees 0 there, then these features
do not work.


> This currently depends on the driver's tolerance.
> What should the driver do when overdue? Shall it reset the device or set FAILED?

Actually drivers in the field can and do change features and try again,
that is also an option.

> I think the device should either SUSPEND successfully or set NEEDS_RESET, but maybe not a good idea to set a time-out in the spec,
> the driver can set FAILED or just reset the device if the operation exceeds the tolerance in pulling.
> 
> Any suggestions?

Seems ok to me.


> >
> >
> >>>> +\item The driver MUST NOT make any more buffers available to the device.
> >>>> +\item The driver MUST NOT access any fields of any virtqueues or notify any virtqueues.
> >>> "send notifications for any virtqueues"?
> >> OK
> >>>> +\item The driver MUST NOT access Device Configuration Space.
> >>> ...except for the status field, if it is part of the config space?
> >> Yes, that is the original design, then I am convinced that the status fields is
> >> not a part of the config space because it has a dedicated section in the spec.
> >>
> >> I will add this sentence in the next version.
> >>>> +\end{itemize}
> >>>> +
> >>>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> >>>> +
> >>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> >>>> +
> >>>> +The device MUST ignore all access to its Configuration Space while
> >>>> +suspended, except for \field{device status}.
> >>> ...if it is part of the configuration space.
> >> Yes
> >>>> +
> >>>> +A device MUST NOT send any notifications, access any virtqueues, or modify
> >>>> +any fields in its configuration space while suspended.
> >>>> +
> >>>> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> >>> "subsequently clears SUSPEND"?
> >> I am a native speaker, but "subsequently" sounds like clearing SUSPEND right after "setting SUSPEND", I guess there can be
> >> some operations during SUSPEND.
> >>
> >>>> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
> >>>> +
> >>>> +When the driver sets SUSPEND,
> >>>> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
> >>>> +
> >>>> +\begin{itemize}
> >>>> +\item Stop processing more buffers of any virtqueues
> >>>> +\item Wait until all buffers that are being processed have been used.
> >>>> +\item Send used buffer notifications to the driver.
> >>>> +\end{itemize}
> >>> So, is there any opportunity for the device to fail setting SUSPEND? I
> >>> mean, if the driver is supposed to look whether it sticks, there should
> >>> be conditions for when the device might clear it again...
> >> The device should not present SUSPEND bit in the device status until it is suspended,
> >> so I am afraid there is not a SUSPEND bit to clear if the device fails to suspend itself.
> >>
> >> I think there can be two indications of a failed suspend:
> >> 1) The driver sets SUSPEND, but the device does not present SUSPEND after a while, depends
> >> on the driver tolerance, the driver may assume it is a failed SUSPEND, like how we handle FEATURES_OK
> >
> > This is not how we handle FEATURES_OK.
> setting FEATURES_OK may not always be successful and can take longer time than expect. What should the driver
> do when the pulling re-reads does not return FEATURES_OK?
> >
> >> 2)The device runs into errors, presenting NEEDS_RESET.
> >>
> > More reasonable.
> OK, so the driver should re-read the status, it should see either SUSPEND or NEEDS_RESET, this works for me.
> 
> Thanks

Or neither to mean "suspend in progress"?


> >
> >>>> +
> >>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> >>>>  
> >>>>  Virtio can use various different buses, thus the standard is split
> >>>> @@ -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
> >>>>  	handling features reserved for future use.
> >>>>  
> >>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> >>>> +   set SUSPEND to the device.
> >>> "that the driver can trigger suspending the device via the SUSPEND flag"?
> >> Yes
> >>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> >>>> +
> >>>>  \end{description}
> >>>>  
> >>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

