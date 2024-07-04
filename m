Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969221AC245
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091967; cv=none; b=FGcYMd555TS/TNXYoUosbxOq5Ez4LsLx3sd1G6uyGvigg0LBqcXpES4QiHEyj3/AaqYpGWvJbf63/7s/Q6MjTFJXcxlrCXr9YQMufEtvxg2/fQb8JU5lwLM28a0b8F1AWxpySv7KyMImDBoTP7S0NuTiVTzj5zNJZQVCRwFc1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091967; c=relaxed/simple;
	bh=f23dbuQT71n/nu4JXC9QrDjoOCom5dOMhTLk7QnsBWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mppQ8C9VTTbvUHO/n6S/eLTnoIpza2dRLn5TKrz+JMI8nrpEpreYavWnX0BIgEuWEvb6S/CZzb8XqVF9DDvzukt61XLeEXakoItJd6Nbn/q2Zx0JqJRvL/Sqc1HRdW875zSaj4PGBhC46JaDeHhrtgtgLNvJ/IRAAsq0X5qI/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MnudpWkE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MnudpWkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720091963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPeO74ktXWcx2f+YfSfa7qg5SOa0S/is/0wBsm0mqRY=;
	b=MnudpWkEL/utQpccrqf8byOuD4c4qWqHq7FKBnO7LNmkCvDGYkahokHV2d8hmkQcDR6KZq
	O9mxv+vTfeoFVT6fP2y4O/+TloA68j1hpb3GGqcPzJHuodul8WXsIzZYKC2rC4QIO+hxOb
	H9BxLj9npYkDeHoIfnsjPNZFyKotdnc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-L8EMtbtKNlmWsszCnluFzQ-1; Thu, 04 Jul 2024 07:19:22 -0400
X-MC-Unique: L8EMtbtKNlmWsszCnluFzQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367987cff30so416487f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 04:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091961; x=1720696761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPeO74ktXWcx2f+YfSfa7qg5SOa0S/is/0wBsm0mqRY=;
        b=AbqBWWYeCcsB6qmytUK2nEq8AZN4J0pFqNPUZ0SvI2P/wb2AcMM0ZypD87mWx8v5l9
         eWHHHGS5sxfGxhrTeJfwlfF0lWsmZbGIIcDiQiqB903pIYI2tnVND9Elt6Cz6JW0ZR/1
         p3jJWpxmU+DOWvYOT9q2Lsqb/T2egfCxuYdXNlOUN2ccXR3BUKEwyKKKWR1A3r02XYKZ
         gVsujsvBPlawFi9EU3UizPBl/oC6/YhC4yCT1DHLo+lQC4x9ThymNY0Ww8/MsaCwuuCG
         BBt5OdpdUArzazgo81o8Vv78oH9gj11SKEJX7bxtAKfQz/abD9KH5/WJCt/3pBOJ0HuA
         GcOw==
X-Forwarded-Encrypted: i=1; AJvYcCWkWxg3CvKfIodEDxRjH/2/a04A1Lr4WQo8KTfkCeGSxVTMZk1YGGp2JHUzL8M4ovHRi72T8ZTWP2Ykb0Uow5gIthCuEPQh1liPBHK2pIM=
X-Gm-Message-State: AOJu0Yxa8lkDytE1m2D+aU3WQrPY07BUX0w14hX76qABwm++Q+RoYgYa
	kdd1zZvTGDMsDdcYk0FdrlYFFry6lXFAbgb78hx405/nl+Is5gPDj9BrArzfJsuW7lEVKaXu+QZ
	v3n3L+cyI4+Hp+0h4cHJHPpOPGjDLWPNUzfYDIMZL5gux404e3Yc97+FsXFsqZorB
X-Received: by 2002:adf:f707:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-3679dd35314mr945834f8f.41.1720091961034;
        Thu, 04 Jul 2024 04:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV4dPR7V7UOqpnLo/eYpKYQuI/Npd5HLh7R9I032Z+puh+uk5hFmVlhyDYqvol1CGWKpne6w==
X-Received: by 2002:adf:f707:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-3679dd35314mr945815f8f.41.1720091960315;
        Thu, 04 Jul 2024 04:19:20 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f0:a185:2de6:83fc:7632:9788])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367990b305bsm2205793f8f.115.2024.07.04.04.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:19:19 -0700 (PDT)
Date: Thu, 4 Jul 2024 07:19:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Keiichi Watanabe <keiichiw@chromium.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"uekawa@chromium.org" <uekawa@chromium.org>,
	"takayas@chromium.org" <takayas@chromium.org>,
	"dverkamp@chromium.org" <dverkamp@chromium.org>,
	"tytso@google.com" <tytso@google.com>
Subject: Re: [PATCH 1/1] virito-blk: Support NOSPC error
Message-ID: <20240704071839-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
 <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240618081240-mutt-send-email-mst@kernel.org>
 <CAD90VcZAkXVfciJnzH+qjgiCFaqMK-Ne-0uL2o3EKcN_At_X1A@mail.gmail.com>
 <20240704035749-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54800E46BF03E95379A5E8CBDCDE2@DM8PR12MB5480.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54800E46BF03E95379A5E8CBDCDE2@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 04, 2024 at 09:52:52AM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, July 4, 2024 1:34 PM
> > 
> > On Wed, Jun 19, 2024 at 10:09:19PM +0900, Keiichi Watanabe wrote:
> > > Thank you for the feedback. Having the new feature bit makes sense.
> > > So, I think we can update the spec as follows:
> > >
> > > * Define VIRTIO_BLK_F_ERRNO feature bit
> > > * If VIRTIO_BLK_F_ERRNO is negotiated, the driver sends the following
> > > virito_blk_req_with_errno instead of virtio_blk_req.
> > > * If VIRTIO_BLK_F_ERRNO is negotiated, when the device sets status to
> > > VIRTIO_BLK_S_IOERR, the device may set errno to a positive value.
> > >
> > > struct virtio_blk_req_with_errno {
> > >   le32 type;
> > >   le32 reserved;
> > >   le64 sector;
> > >   u8 data[];
> > >   u8 status;
> > >   u8 padding[3];
> > >   le32 errno;
> > > };
> > >
> > > Does it make sense? If so, I'll make v2 patch.
> > > Note that I used le32 for errno above because POSIX spec [1] says
> > > errno is int and int is usually 4 bytes.
> > >
> > > [1]:
> > >
> > https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.ht
> > ml
> > >
> > > Keiichi
> > 
> > Thought hard about it. I think expanding the request for errno is unwelcome.
> True, seems overkill.
> 
> > What we can do, if you really want to do it, is when VIRTIO_BLK_F_ERRNO is
> > negotiated, then make error codes different.
> > 
> Do we also need a feature bit?
> If the device reports req.status == ENOSPC convert into the NOSPC error code.
> If it returns VIRTIO_BLK_S_IOERR, than generic EIO?
> 
> This is because there is no gain in telling the device to return special error code on hitting a special error.
> It returns the error if it has support for it. that’s it.
> 
> I am unable to see the benefit of extra negotiation.
> Would this simplicity work?

No - old drivers won't know how to handle the new ENOSPC.


> > ./include/uapi/asm-generic/errno.h has numbers that only go up to about 60.
> > So ok for now.
> > 
> > As to whether just keep your approach, can we see some analysis which errors
> > are likely to happen at the block level?
> > If there are many more of them, then reusing errno begins to make sense.
> > 
> > >
> > > On Tue, Jun 18, 2024 at 9:18 PM Michael S. Tsirkin <mst@redhat.com>
> > wrote:
> > > >
> > > > On Tue, Jun 18, 2024 at 11:54:10AM +0000, Parav Pandit wrote:
> > > > > Hi Keiichi,
> > > > >
> > > > > > From: Keiichi Watanabe <keiichiw@chromium.org>
> > > > > > Sent: Tuesday, June 18, 2024 1:49 PM
> > > > > > To: virtio-comment@lists.linux.dev
> > > > > > Cc: keiichiw@chromium.org; uekawa@chromium.org;
> > > > > > takayas@chromium.org; dverkamp@chromium.org;
> > tytso@google.com
> > > > > > Subject: [PATCH 1/1] virito-blk: Support NOSPC error
> > > > > >
> > > > > > Add a status code to indicate that the storage is full on the
> > > > > > virtio-blk device side.
> > > > > >
> > > > > > This is useful in scenarios where a virtio-blk disk image is
> > > > > > provided on a sparse disk and the host storage is full.
> > > > > > In this scenario, the driver cannot create a new file to the
> > > > > > disk image because the sparse disk cannot be expanded.
> > > > > > However, if the host have a service that clean up host stroage
> > > > > > regularly by
> > > > > s/stroage/storage
> > > > >
> > > > > > wiping cache files, the guest may want to retry the request.
> > > > > > For this type of special handling, this error should have a
> > > > > > separate error code in virito-blk.
> > > > > >
> > > > > > Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> > > > > > ---
> > > > > >  device-types/blk/description.tex | 13 ++++++++-----
> > > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/device-types/blk/description.tex
> > > > > > b/device-types/blk/description.tex
> > > > > > index f04c932..5a34bd5 100644
> > > > > > --- a/device-types/blk/description.tex
> > > > > > +++ b/device-types/blk/description.tex
> > > > > > @@ -532,12 +532,14 @@ \subsection{Device
> > > > > > Operation}\label{sec:Device Types / Block Device / Device Ope
> > > > > >
> > > > > >  The final \field{status} byte is written by the device: either
> > > > > > VIRTIO_BLK_S_OK for success, VIRTIO_BLK_S_IOERR for device or
> > > > > > driver -error or VIRTIO_BLK_S_UNSUPP for a request unsupported by
> > device:
> > > > > > +error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device
> > > > > > +or VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough
> > space.
> > > > > >
> > > > > >  \begin{lstlisting}
> > > > > >  #define VIRTIO_BLK_S_OK        0
> > > > > >  #define VIRTIO_BLK_S_IOERR     1
> > > > > >  #define VIRTIO_BLK_S_UNSUPP    2
> > > > > > +#define VIRTIO_BLK_S_NOSPC     7
> > > > > >  \end{lstlisting}
> > > > > >
> > > > > With recent work from Michael and others in admin command area,
> > > > >
> > > > > we try to use existing Linux error codes referenced by the spec [errno] in
> > the "Normative References" section.
> > > > > So for this new error code also, it would be good to reuse value 28
> > (instead of 7) of [2].
> > > > >
> > > > > [1]
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > > > /tree/include/uapi/asm-generic/errno-base.h
> > > > > [2]
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > > > /tree/include/uapi/asm-generic/errno-base.h#n32
> > > >
> > > >
> > > > The problem with this idea, is that e.g. EIO is 5 which is already
> > > > used up by zone flags. And errno values go beyond 127 so with a
> > > > single byte status we can't reserve a bit for that, either.
> > > >
> > > >
> > > > > >  The status of individual segments is indeterminate when a
> > > > > > discard or write zero @@ -567,10 +569,11 @@ \subsection{Device
> > > > > > Operation}\label{sec:Device Types / Block Device / Device Ope
> > > > > > Requests of type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
> > > > > > VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH,
> > > > > > VIRTIO_BLK_T_ZONE_APPEND,  VIRTIO_BLK_T_ZONE_RESET or
> > > > > > VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the -device with
> > > > > > VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP -
> > > > > > \field{status}, or, additionally, with
> > > > > > VIRTIO_BLK_S_ZONE_INVALID_CMD, -
> > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > > > > > VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or -
> > > > > > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> > > > > > +device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR,
> > > > > > VIRTIO_BLK_S_UNSUPP or
> > > > > > +VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
> > > > > > +VIRTIO_BLK_S_ZONE_INVALID_CMD,
> > > > > > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > > > > > +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> > > > > > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE
> > > > > > +ZBD-specific status codes.
> > > > > >
> > > > > >  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests
> > > > > > return the starting sector of the appended data back to the
> > > > > > driver. For this reason,
> > > > > > --
> > > > > > 2.45.2.627.g7a2c4fd464-goog
> > > > > >
> > > > >
> > > >
> 

