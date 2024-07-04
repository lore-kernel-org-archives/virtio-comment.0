Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E700918637
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720080254; cv=none; b=N1J61CwFviiEr6ZUZSuyg2yKyV4WIDYIVbxb+8S5RsgkgZPuXZSj5vUs7SC94n0UrSVsGCeY6ClZViEdXyFXkY+9y7BcYwUwzNea4ynibIQiuw2/yKq6R1IPbY8CsJ9umxSVg7svk5W7Va9kLFZ+x5maSOQ+9vdKS7K2pgtowvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720080254; c=relaxed/simple;
	bh=jzLVUfn5gPWI8QQTZbMqvOminNs1eB5ZpehqdCNe+5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PgWJ4+osGYioL3lMVH/AjMGIyFWI813AM4nW1KdC0NfwOF5E/+WqmRVyb7YRAwQEO8Vq5d+VAsLAHU8AdkkNtg3FggVvLvape78U9pxH3BKdIxT/a7u7P12SOvmBnwzF9ZXjoNxA9EptDsV9GGVfDRrc84wsSiZIenNMnh74uhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHjvDEQn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHjvDEQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720080251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcweN4BUrtqMLSq8+mtcmYUkbfVZ8cFv1kqlNVrEhIk=;
	b=JHjvDEQn+JrV9XCch2aAGHt4YhYMB6K/uwGmV8ZS8o5QL3IrXyKGVyfP9TM5rzPrJKiEf/
	5MwCJkvQZCF5soM6yEhVcLoaJfjF+czWNzqSZbYtpV+1KsKvFtGYkOj2HY17QeEdkkiGQ6
	7nUU7KgRO+58ZH2zRa4qyW5qpo7q1k8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-uyoFMg6YM-a89jityfHPyA-1; Thu, 04 Jul 2024 04:04:10 -0400
X-MC-Unique: uyoFMg6YM-a89jityfHPyA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ee45dea727so4113121fa.2
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 01:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720080249; x=1720685049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcweN4BUrtqMLSq8+mtcmYUkbfVZ8cFv1kqlNVrEhIk=;
        b=bGiKotHfTyKhjaDkbMPSh0a4X/mRS6JiOA390wufWBUzC0PXFtwP3piexSMkH3xqJv
         n+8Ei8YoiHMt00647VvI1ijKT1ry5UMk9J3ToJ+OsKTh7kovDtHWuDDIQ6XnptRNx7MK
         xm14wZy3673pb6ZMSqFBlrnfBjr9NT+O+w65Zd+RN/fzXUjHkN+/g1B3Pnb0iipRkpTL
         mPXz7/v7qc5aUpdltwZJucgY25/cmnFmcFrAGbHCr+PGFcKsx1mB3wvM/mrgU1+V4Chv
         bXMNfNpm6GCMbGAA521dJwQJpVqqzVyHJo9StEACm6mJptKTj9tjIN2fV8OSG56BKhmt
         RXaA==
X-Forwarded-Encrypted: i=1; AJvYcCU6005IXXi0ZMHc7ZWZ/C2dKYC5nwXLrdgA/XylD4Y0Y2amlP0YZtJXRXYS6YWQfKDUNhC9oUqlUZ0L6jK3em28K7+BSpfNAhWgeyXM7+0=
X-Gm-Message-State: AOJu0YzsSWLkCgDJu6duwcdY+EAzt8LVIs5vEdQ+rcuZuCe4knbhp7yw
	B0SR7V2/VGh1y9lVsgesSmus4/pqjQP7EEuwAEnX/9yQl/PY/Q99y/o4+/u3U8So6sIbamlhLrP
	avpg0TK7nq/eTLm9a9VbwtQZW8u93YOnegkQFYipvzxVTTY5tCr4zNDPsccOkkwb8
X-Received: by 2002:a2e:9b15:0:b0:2ec:5b8f:c797 with SMTP id 38308e7fff4ca-2ee8ec7c1eemr6766701fa.0.1720080248641;
        Thu, 04 Jul 2024 01:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMFZ2bWe48ca9N41N8KosL0xbp9F+PBG0JqZVpydEYs/P1P0sOf6CwazVCD2ToLmjNjErMEQ==
X-Received: by 2002:a2e:9b15:0:b0:2ec:5b8f:c797 with SMTP id 38308e7fff4ca-2ee8ec7c1eemr6765671fa.0.1720080245934;
        Thu, 04 Jul 2024 01:04:05 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:82e2:c2d2:c800:4b76:dc98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6677sm13412765e9.17.2024.07.04.01.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 01:04:05 -0700 (PDT)
Date: Thu, 4 Jul 2024 04:04:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"uekawa@chromium.org" <uekawa@chromium.org>,
	"takayas@chromium.org" <takayas@chromium.org>,
	"dverkamp@chromium.org" <dverkamp@chromium.org>,
	"tytso@google.com" <tytso@google.com>
Subject: Re: [PATCH 1/1] virito-blk: Support NOSPC error
Message-ID: <20240704035749-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
 <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240618081240-mutt-send-email-mst@kernel.org>
 <CAD90VcZAkXVfciJnzH+qjgiCFaqMK-Ne-0uL2o3EKcN_At_X1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD90VcZAkXVfciJnzH+qjgiCFaqMK-Ne-0uL2o3EKcN_At_X1A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jun 19, 2024 at 10:09:19PM +0900, Keiichi Watanabe wrote:
> Thank you for the feedback. Having the new feature bit makes sense.
> So, I think we can update the spec as follows:
> 
> * Define VIRTIO_BLK_F_ERRNO feature bit
> * If VIRTIO_BLK_F_ERRNO is negotiated, the driver sends the following
> virito_blk_req_with_errno instead of virtio_blk_req.
> * If VIRTIO_BLK_F_ERRNO is negotiated, when the device sets status to
> VIRTIO_BLK_S_IOERR, the device may set errno to a positive value.
> 
> struct virtio_blk_req_with_errno {
>   le32 type;
>   le32 reserved;
>   le64 sector;
>   u8 data[];
>   u8 status;
>   u8 padding[3];
>   le32 errno;
> };
> 
> Does it make sense? If so, I'll make v2 patch.
> Note that I used le32 for errno above because POSIX spec [1] says
> errno is int and int is usually 4 bytes.
> 
> [1]: https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.html
> 
> Keiichi

Thought hard about it. I think expanding the request for errno is
unwelcome. What we can do, if you really want to do it, is when
VIRTIO_BLK_F_ERRNO is negotiated, then make error codes different.

./include/uapi/asm-generic/errno.h has numbers that only go up
to about 60. So ok for now.

As to whether just keep your approach, can we see some
analysis which errors are likely to happen at the block level?
If there are many more of them, then reusing errno begins to
make sense.

> 
> On Tue, Jun 18, 2024 at 9:18 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jun 18, 2024 at 11:54:10AM +0000, Parav Pandit wrote:
> > > Hi Keiichi,
> > >
> > > > From: Keiichi Watanabe <keiichiw@chromium.org>
> > > > Sent: Tuesday, June 18, 2024 1:49 PM
> > > > To: virtio-comment@lists.linux.dev
> > > > Cc: keiichiw@chromium.org; uekawa@chromium.org;
> > > > takayas@chromium.org; dverkamp@chromium.org; tytso@google.com
> > > > Subject: [PATCH 1/1] virito-blk: Support NOSPC error
> > > >
> > > > Add a status code to indicate that the storage is full on the virtio-blk device
> > > > side.
> > > >
> > > > This is useful in scenarios where a virtio-blk disk image is provided on a sparse
> > > > disk and the host storage is full.
> > > > In this scenario, the driver cannot create a new file to the disk image because
> > > > the sparse disk cannot be expanded.
> > > > However, if the host have a service that clean up host stroage regularly by
> > > s/stroage/storage
> > >
> > > > wiping cache files, the guest may want to retry the request.
> > > > For this type of special handling, this error should have a separate error code
> > > > in virito-blk.
> > > >
> > > > Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> > > > ---
> > > >  device-types/blk/description.tex | 13 ++++++++-----
> > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> > > > index f04c932..5a34bd5 100644
> > > > --- a/device-types/blk/description.tex
> > > > +++ b/device-types/blk/description.tex
> > > > @@ -532,12 +532,14 @@ \subsection{Device Operation}\label{sec:Device
> > > > Types / Block Device / Device Ope
> > > >
> > > >  The final \field{status} byte is written by the device: either  VIRTIO_BLK_S_OK
> > > > for success, VIRTIO_BLK_S_IOERR for device or driver -error or
> > > > VIRTIO_BLK_S_UNSUPP for a request unsupported by device:
> > > > +error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device or
> > > > +VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough space.
> > > >
> > > >  \begin{lstlisting}
> > > >  #define VIRTIO_BLK_S_OK        0
> > > >  #define VIRTIO_BLK_S_IOERR     1
> > > >  #define VIRTIO_BLK_S_UNSUPP    2
> > > > +#define VIRTIO_BLK_S_NOSPC     7
> > > >  \end{lstlisting}
> > > >
> > > With recent work from Michael and others in admin command area,
> > >
> > > we try to use existing Linux error codes referenced by the spec [errno] in the "Normative References" section.
> > > So for this new error code also, it would be good to reuse value 28 (instead of 7) of [2].
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/asm-generic/errno-base.h
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/asm-generic/errno-base.h#n32
> >
> >
> > The problem with this idea, is that e.g. EIO is 5 which is already used
> > up by zone flags. And errno values go beyond 127 so with a single byte
> > status we can't reserve a bit for that, either.
> >
> >
> > > >  The status of individual segments is indeterminate when a discard or write
> > > > zero @@ -567,10 +569,11 @@ \subsection{Device
> > > > Operation}\label{sec:Device Types / Block Device / Device Ope  Requests of
> > > > type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
> > > > VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH,
> > > > VIRTIO_BLK_T_ZONE_APPEND,  VIRTIO_BLK_T_ZONE_RESET or
> > > > VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the -device with
> > > > VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP -
> > > > \field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD, -
> > > > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > > > VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or -
> > > > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> > > > +device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR,
> > > > VIRTIO_BLK_S_UNSUPP or
> > > > +VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
> > > > +VIRTIO_BLK_S_ZONE_INVALID_CMD,
> > > > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > > > +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> > > > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE
> > > > +ZBD-specific status codes.
> > > >
> > > >  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
> > > > starting sector of the appended data back to the driver. For this reason,
> > > > --
> > > > 2.45.2.627.g7a2c4fd464-goog
> > > >
> > >
> >

