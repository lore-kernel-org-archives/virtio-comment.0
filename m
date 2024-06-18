Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD292139BF
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713131; cv=none; b=iQIw7ghMghpqiz3KIUvnAUk/8F02CfsSzNWEwyLrJaDT7VySL/TM2lu1KL3hvRz+g9BWZvjTVvVeCRe8zSm5tRkrbw+VCoNClrGArkVCuCxV3vXwv/oFwNjTcKX/LrztbkQDyhpw9tj2OWAqQNRs/7VuFkJY25YiUcFbML68F88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713131; c=relaxed/simple;
	bh=X3vjH4vwyePRd5O8YGp8FXUNKTO3CmHuLp/7Cg7f9aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bz49qP3RhAxs9ovYvZLEXXL0gp4IPXSuQr6mFlsSQW0f2DaQ7YC6e980owIOtSQnXRpI9EEhzvFLz9UOGlweOVCx1yXgFZQsPeLHsIXQQKneUsQc0wkoeOSeJagTOtbMdrheeiY+3LQdyCD/Yu9erNSnpg81MAEGnTgSPzGR1AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/n6oQT8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/n6oQT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718713127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jEEppKd0bcQcSkxEu1CuGmSsE7oC2XBalXwKc0tryF0=;
	b=Q/n6oQT8H1FBXY0lKio6HhuEj6gNnbejMx4Q/378SBRAK3gP726Y9g/y8Ixb1OTU279cDw
	8dYZFIQ1+fbAHFm6y4hAdslGlyTTIBGXmRUBiMrGBYuUYiS/U1sJZnVSb1tGYB2pKILtwM
	ty32pQw0MhKNo1++gqMkHNPaSBR2lzQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-mfg4LXLjM4S0PyR6Td3oGQ-1; Tue, 18 Jun 2024 08:18:46 -0400
X-MC-Unique: mfg4LXLjM4S0PyR6Td3oGQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52bc124ef2eso1266148e87.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 05:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718713125; x=1719317925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEEppKd0bcQcSkxEu1CuGmSsE7oC2XBalXwKc0tryF0=;
        b=beusCISecLveEeU7Pgko8hCHZL7qs1gjDEPii2sG7Kvp5rTAW6wJMqlViMzdbwWJOh
         pzgiU6OPpfxn9gv2HFspmRCWmiEG1+C6oa94CUlwXwRGlQgVXWbWKO3dQuFQznevywxi
         eQ6RAWemofXFZeWrWXGMxu96i4E+zt8Y6S0vcQ8gsYkthQTKjAto6dTUwiI4l63mJfKl
         ffYiZGgUWZ6HQBXXyIyqkSprnjClF1+3lnwj95yaH13Dh892Y0hRcQgDNzHshrDdrDvt
         K3tDy+MDB2VXFa9LvGlzSa09vFxH9K+i3Pep4D9Fkx6NyWM/yuMYddfu6L99zowhkNj1
         FvCg==
X-Forwarded-Encrypted: i=1; AJvYcCVD0AkwT84DpmCSSFis7V+apLE2Yw+t37uKy236EsyxVXhCZeReJm7mUIwJrR0sOiB0tbwqwRHZfBhlwsK+INRODOKGpK4OBMsA+Npwfag=
X-Gm-Message-State: AOJu0YyN3pR2bC/nQwvPDo2F1jKljeI618IfEUKCSFOm37fxWk0kS3WC
	eYvBOTdevRc+Um1ofbwpRqWABuXdCScCQcZkU9ts259gnJpU27hF8OcCnv0jRwh+gRpdEfpxU5E
	MadntywyQuwsOSnjirfZHUGr7sRO8sIUiBRTWCIRhGCirHN/qwiJpmDIekLW6aY6U
X-Received: by 2002:a05:6512:3da7:b0:52c:b329:f7eb with SMTP id 2adb3069b0e04-52cb329f887mr6449462e87.12.1718713124640;
        Tue, 18 Jun 2024 05:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPS6oqcLvTXSNGqdj+dh7FmBwrLzswWX2RPA6KJR78RtOSRVNtIYDSAIxVmRhs82jSLRn75Q==
X-Received: by 2002:a05:6512:3da7:b0:52c:b329:f7eb with SMTP id 2adb3069b0e04-52cb329f887mr6449429e87.12.1718713124078;
        Tue, 18 Jun 2024 05:18:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:67bf:ebbb:9f62:dc29:2bdc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360940d992fsm5749572f8f.116.2024.06.18.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 05:18:43 -0700 (PDT)
Date: Tue, 18 Jun 2024 08:18:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Keiichi Watanabe <keiichiw@chromium.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"uekawa@chromium.org" <uekawa@chromium.org>,
	"takayas@chromium.org" <takayas@chromium.org>,
	"dverkamp@chromium.org" <dverkamp@chromium.org>,
	"tytso@google.com" <tytso@google.com>
Subject: Re: [PATCH 1/1] virito-blk: Support NOSPC error
Message-ID: <20240618081240-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
 <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 11:54:10AM +0000, Parav Pandit wrote:
> Hi Keiichi,
> 
> > From: Keiichi Watanabe <keiichiw@chromium.org>
> > Sent: Tuesday, June 18, 2024 1:49 PM
> > To: virtio-comment@lists.linux.dev
> > Cc: keiichiw@chromium.org; uekawa@chromium.org;
> > takayas@chromium.org; dverkamp@chromium.org; tytso@google.com
> > Subject: [PATCH 1/1] virito-blk: Support NOSPC error
> > 
> > Add a status code to indicate that the storage is full on the virtio-blk device
> > side.
> > 
> > This is useful in scenarios where a virtio-blk disk image is provided on a sparse
> > disk and the host storage is full.
> > In this scenario, the driver cannot create a new file to the disk image because
> > the sparse disk cannot be expanded.
> > However, if the host have a service that clean up host stroage regularly by
> s/stroage/storage
> 
> > wiping cache files, the guest may want to retry the request.
> > For this type of special handling, this error should have a separate error code
> > in virito-blk.
> > 
> > Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> > ---
> >  device-types/blk/description.tex | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> > index f04c932..5a34bd5 100644
> > --- a/device-types/blk/description.tex
> > +++ b/device-types/blk/description.tex
> > @@ -532,12 +532,14 @@ \subsection{Device Operation}\label{sec:Device
> > Types / Block Device / Device Ope
> > 
> >  The final \field{status} byte is written by the device: either  VIRTIO_BLK_S_OK
> > for success, VIRTIO_BLK_S_IOERR for device or driver -error or
> > VIRTIO_BLK_S_UNSUPP for a request unsupported by device:
> > +error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device or
> > +VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough space.
> > 
> >  \begin{lstlisting}
> >  #define VIRTIO_BLK_S_OK        0
> >  #define VIRTIO_BLK_S_IOERR     1
> >  #define VIRTIO_BLK_S_UNSUPP    2
> > +#define VIRTIO_BLK_S_NOSPC     7
> >  \end{lstlisting}
> > 
> With recent work from Michael and others in admin command area,
> 
> we try to use existing Linux error codes referenced by the spec [errno] in the "Normative References" section.
> So for this new error code also, it would be good to reuse value 28 (instead of 7) of [2].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/asm-generic/errno-base.h
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/asm-generic/errno-base.h#n32


The problem with this idea, is that e.g. EIO is 5 which is already used
up by zone flags. And errno values go beyond 127 so with a single byte
status we can't reserve a bit for that, either.


> >  The status of individual segments is indeterminate when a discard or write
> > zero @@ -567,10 +569,11 @@ \subsection{Device
> > Operation}\label{sec:Device Types / Block Device / Device Ope  Requests of
> > type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
> > VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH,
> > VIRTIO_BLK_T_ZONE_APPEND,  VIRTIO_BLK_T_ZONE_RESET or
> > VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the -device with
> > VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP -
> > \field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD, -
> > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or -
> > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> > +device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR,
> > VIRTIO_BLK_S_UNSUPP or
> > +VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
> > +VIRTIO_BLK_S_ZONE_INVALID_CMD,
> > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE
> > +ZBD-specific status codes.
> > 
> >  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
> > starting sector of the appended data back to the driver. For this reason,
> > --
> > 2.45.2.627.g7a2c4fd464-goog
> > 
> 

