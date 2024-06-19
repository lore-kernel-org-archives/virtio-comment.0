Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A0012FB31
	for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802574; cv=none; b=BsahaeFnvQLBidDoc2pGb15QecMgMjd9SgTHWRFXAlweFVEiEfuURYQZsz1+IBFwm0Js28OZjGEbchvdmRx1n6A7wi7RS9msuzn5aY0SJYrCxwdzsdGqoxiZwOR/1109D0o/t7GUTJiE3KZ1XihYe6famXsvWOuVD8nLO1S4hFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802574; c=relaxed/simple;
	bh=ooM0CIsenQgD81OMPWVRu9Sfy64Q6zoYSYgKLCFT2fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8OuInv3eJuOYIig0/feJ+vA8Cv94PKH66n5v4bWY9A7OYD3f9ntXe3noBSYTnpnXkew4oB+kIaSRGLL62x4UC2J4HUSrNYhmmHp9HvWOL5y3SYY8WCjCPrpoW8q3RBXdCJyhA1CGwTt38PWAzqv3p8xGdg2yYAJaMmsbC7YJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nLQ1Rs7u; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nLQ1Rs7u"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfe1aa7cce2so7116443276.1
        for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718802571; x=1719407371; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU7KsmaL/EoCXSGn09dS41iOrQiNL87Dhm/X2BUMKOE=;
        b=nLQ1Rs7uMviqz1VWv97Sn+d6bBi3zHwWmceIN1uJTm29pwFVx9aWHFq/cCEp+oMDxT
         QMfFnJF84xtGMqK0FDLseHJwWl/YH1l6m+T3GFL1vFMRQh1xX8LAkpdOmB+6CLwhmY9u
         8yJq3ncseJpTPfRzXRqarvfsd4xwmLgbLxJLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718802571; x=1719407371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU7KsmaL/EoCXSGn09dS41iOrQiNL87Dhm/X2BUMKOE=;
        b=RmVEdHyVtX+7Mj8YlwJufBgrDuZvREzLTBRd0lH90eT+qg6AWUv1sFtrByrXwf3Ud4
         QaS84WxSu2QOkf7+1Ce+Xf7LaYyGMXOIwdpqI0cmCSC4sNV7YuWAO76FG/SmuYtWgatt
         aKm1/Qg73VeyjeffAD5vUBFHVMrHrF8L3XF3xtCdh7PfHE656t5tOGEdgFvuCbp0rQqt
         Tl2iImSK8KkvqzhK1LcZUcQyQ5g8fPf24q11xNVFQjNj15z9IfXK6vyfnaU8DfDJHZ/D
         uvG5MsbBFiJgVbSCNqiKw5t/XRzM2fQjig0ByUOIWqfVpLNdVp5EjtUaGfhHj4/feFWG
         AnUw==
X-Forwarded-Encrypted: i=1; AJvYcCV0DQq2ByS0DeXXPjUOMnb1e5O2nnazl7mjK0Irl9Z9w2+1ncn4h40L+IS5HuINfHe+04ZOcnmWu8CvcWniR/hrhALSiAnOuYtT/pbed0s=
X-Gm-Message-State: AOJu0YwdZIJvRaP3xMJTT9OaVvkl1sq4LmiJGuCXWuoJUzMeLmnSqXfg
	dvqraa0UlWtrEOKftiq+O4j3rUuUyzBlMWhuNMRjex+mLMakkRiqUYIfVCOBD3dIXz2WhYigCBV
	mFSYg2o8PoG6D6wpeqX0Xs4wH7qh5psFV6epD
X-Google-Smtp-Source: AGHT+IEignW2p2StJnDylcHBT58/C8xEHiB0WVXgqhXi9hx7/osx9sGbH6BYZEdNqycXnTy4A1DcwENQVN5HhSZZGBc=
X-Received: by 2002:a25:5f47:0:b0:dff:2a80:5687 with SMTP id
 3f1490d57ef6-e02be19ec41mr2886509276.34.1718802571001; Wed, 19 Jun 2024
 06:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org> <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240618081240-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240618081240-mutt-send-email-mst@kernel.org>
From: Keiichi Watanabe <keiichiw@chromium.org>
Date: Wed, 19 Jun 2024 22:09:19 +0900
Message-ID: <CAD90VcZAkXVfciJnzH+qjgiCFaqMK-Ne-0uL2o3EKcN_At_X1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] virito-blk: Support NOSPC error
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"uekawa@chromium.org" <uekawa@chromium.org>, "takayas@chromium.org" <takayas@chromium.org>, 
	"dverkamp@chromium.org" <dverkamp@chromium.org>, "tytso@google.com" <tytso@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the feedback. Having the new feature bit makes sense.
So, I think we can update the spec as follows:

* Define VIRTIO_BLK_F_ERRNO feature bit
* If VIRTIO_BLK_F_ERRNO is negotiated, the driver sends the following
virito_blk_req_with_errno instead of virtio_blk_req.
* If VIRTIO_BLK_F_ERRNO is negotiated, when the device sets status to
VIRTIO_BLK_S_IOERR, the device may set errno to a positive value.

struct virtio_blk_req_with_errno {
  le32 type=CD=BE
  le32 reserved=CD=BE
  le64 sector=CD=BE
  u8 data[]=CD=BE
  u8 status=CD=BE
  u8 padding[3];
  le32 errno;
}=CD=BE

Does it make sense? If so, I'll make v2 patch.
Note that I used le32 for errno above because POSIX spec [1] says
errno is int and int is usually 4 bytes.

[1]: https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.html

Keiichi


On Tue, Jun 18, 2024 at 9:18=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Jun 18, 2024 at 11:54:10AM +0000, Parav Pandit wrote:
> > Hi Keiichi,
> >
> > > From: Keiichi Watanabe <keiichiw@chromium.org>
> > > Sent: Tuesday, June 18, 2024 1:49 PM
> > > To: virtio-comment@lists.linux.dev
> > > Cc: keiichiw@chromium.org; uekawa@chromium.org;
> > > takayas@chromium.org; dverkamp@chromium.org; tytso@google.com
> > > Subject: [PATCH 1/1] virito-blk: Support NOSPC error
> > >
> > > Add a status code to indicate that the storage is full on the virtio-=
blk device
> > > side.
> > >
> > > This is useful in scenarios where a virtio-blk disk image is provided=
 on a sparse
> > > disk and the host storage is full.
> > > In this scenario, the driver cannot create a new file to the disk ima=
ge because
> > > the sparse disk cannot be expanded.
> > > However, if the host have a service that clean up host stroage regula=
rly by
> > s/stroage/storage
> >
> > > wiping cache files, the guest may want to retry the request.
> > > For this type of special handling, this error should have a separate =
error code
> > > in virito-blk.
> > >
> > > Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> > > ---
> > >  device-types/blk/description.tex | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/device-types/blk/description.tex b/device-types/blk/desc=
ription.tex
> > > index f04c932..5a34bd5 100644
> > > --- a/device-types/blk/description.tex
> > > +++ b/device-types/blk/description.tex
> > > @@ -532,12 +532,14 @@ \subsection{Device Operation}\label{sec:Device
> > > Types / Block Device / Device Ope
> > >
> > >  The final \field{status} byte is written by the device: either  VIRT=
IO_BLK_S_OK
> > > for success, VIRTIO_BLK_S_IOERR for device or driver -error or
> > > VIRTIO_BLK_S_UNSUPP for a request unsupported by device:
> > > +error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device or
> > > +VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough spac=
e.
> > >
> > >  \begin{lstlisting}
> > >  #define VIRTIO_BLK_S_OK        0
> > >  #define VIRTIO_BLK_S_IOERR     1
> > >  #define VIRTIO_BLK_S_UNSUPP    2
> > > +#define VIRTIO_BLK_S_NOSPC     7
> > >  \end{lstlisting}
> > >
> > With recent work from Michael and others in admin command area,
> >
> > we try to use existing Linux error codes referenced by the spec [errno]=
 in the "Normative References" section.
> > So for this new error code also, it would be good to reuse value 28 (in=
stead of 7) of [2].
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/include/uapi/asm-generic/errno-base.h
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/include/uapi/asm-generic/errno-base.h#n32
>
>
> The problem with this idea, is that e.g. EIO is 5 which is already used
> up by zone flags. And errno values go beyond 127 so with a single byte
> status we can't reserve a bit for that, either.
>
>
> > >  The status of individual segments is indeterminate when a discard or=
 write
> > > zero @@ -567,10 +569,11 @@ \subsection{Device
> > > Operation}\label{sec:Device Types / Block Device / Device Ope  Reques=
ts of
> > > type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
> > > VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH,
> > > VIRTIO_BLK_T_ZONE_APPEND,  VIRTIO_BLK_T_ZONE_RESET or
> > > VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the -device with
> > > VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP -
> > > \field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD=
, -
> > > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > > VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or -
> > > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> > > +device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR,
> > > VIRTIO_BLK_S_UNSUPP or
> > > +VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
> > > +VIRTIO_BLK_S_ZONE_INVALID_CMD,
> > > VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > > +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> > > VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE
> > > +ZBD-specific status codes.
> > >
> > >  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return=
 the
> > > starting sector of the appended data back to the driver. For this rea=
son,
> > > --
> > > 2.45.2.627.g7a2c4fd464-goog
> > >
> >
>
