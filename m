Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F481422B7
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 22:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720047290; cv=none; b=bw7XXW9uk9hDT+40HLCF+yG3DniA8vrZVrcMcndYESssjd3RF3YbYcP3JEuZb4Tljl3QG39jmxNntGH2uv4vvkLoGY/+FaqaLMM7eIq0XcftENvCTDH9RicNfgrg7zcZ+m8s2Vv5wrFUbtErc0/08ZYdPdCNTkZC6xmBDB0EZXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720047290; c=relaxed/simple;
	bh=TLr3fbLBtA6HuTBvn8bN3Mc+hTez5QvW6HjIPBczbNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kryQZND2yLMZc71D4PsGxH6hMA3VU7TwT7k2GuLqdrb3PpffDlRlhnGAx1gKqZ37YN0lZhgu+xE1Vjqwx/z/IiGzZu4A4QKqdx8PIoKwSkKHh6xEZUPLCGYJf8GC+0VJeIyaUpzXzjsm4wz3dnQ5s5oUO2XoMrwMRAvUGHKkvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0zekQpw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0zekQpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720047287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4Hoif9LRAePUYR+PLikHsqW92+ywkRKLf5faZM3XMc=;
	b=c0zekQpwYw8LHL5vP3PI/OMX2/v7ruxjV6u9SY3Td1CpEb+R+3WSFbJM9DgXn1O4Vc19iJ
	uh3Vu5NE75ff7EPWP/SXpVkah3UHJwMwThq05mCu1nuLXvhvmdOSEar8ci3GL+eBpxOOcp
	tYtlMuWKFqOSx1YIQVhmMJNqT1dhEtw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-DMbtzPv2NoSzzCvaM_k-vA-1; Wed, 03 Jul 2024 18:54:45 -0400
X-MC-Unique: DMbtzPv2NoSzzCvaM_k-vA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a72b270df57so2197966b.1
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 15:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720047284; x=1720652084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4Hoif9LRAePUYR+PLikHsqW92+ywkRKLf5faZM3XMc=;
        b=ccnlqdDiQDTw1UylCTmg19UM91za2b4KpclPIGnlHdb4QK/Se/+pd75tM7reXTohIP
         goFFl5W/qtkOn3RRrURNW6T9faJRHJsYwH6ETq9jv1RsINuvfsvcu9gWEES+xtbf6Mu0
         BqRmIamgbqtb0vNWjjTbiTBrrYABzjnHopp3iAZfjoGom5nl9OhnxrSb2/E4s+3eyBxR
         aWEPpXzdI9VQxyumgQmfaZPijQKdyHzGAcjuFZbyKgCcZz/1hO5sfDv0jKkA8Gv2F2fc
         AUEDp3BfvHSw56ePflPxiVFk9IAjarPWGpTw9NnvYciKmtw4J1KdHtAC/8MRCiyMp8Ez
         cKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXFpaf6SX/8pqPAjTEZ0/6MYbgPL2PlTBpMKbL1kcHopgj1efRewXGfw41/1xGbglFCaKJB2r9khBTWdqkHLjvLkAm6Cxbm0kPMrNq10js=
X-Gm-Message-State: AOJu0Yx7s1388repg3PoS0pF15cELzbrusdxc9tweEIzbawvKCqmHuEi
	cd4k1JqjNTpCezQPfdTJo7s0hpA3RLqIgFtkvpcQdWttg5ebnT4nXBvDFhRxaz+i2grs6sMpz9a
	cSb00Hu+RplRYI4267eLaCRL/5ZULun45cdfH1+DwIuIv7CdKIsi/eXqT5pN+ky1Z
X-Received: by 2002:a17:907:9615:b0:a72:b2a4:e1fd with SMTP id a640c23a62f3a-a75143fea84mr1029153566b.45.1720047284551;
        Wed, 03 Jul 2024 15:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKHJ2wARpgMjAgjuWTM9t9UdRKAZot9XClvGIbIL4ijsSpbqY9IYSHrJAN2k4hnaZmJWHetw==
X-Received: by 2002:a17:907:9615:b0:a72:b2a4:e1fd with SMTP id a640c23a62f3a-a75143fea84mr1029152066b.45.1720047283927;
        Wed, 03 Jul 2024 15:54:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0b341fsm548270166b.196.2024.07.03.15.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 15:54:42 -0700 (PDT)
Date: Wed, 3 Jul 2024 18:54:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"uekawa@chromium.org" <uekawa@chromium.org>,
	"takayas@chromium.org" <takayas@chromium.org>,
	"dverkamp@chromium.org" <dverkamp@chromium.org>,
	"tytso@google.com" <tytso@google.com>
Subject: Re: [PATCH 1/1] virito-blk: Support NOSPC error
Message-ID: <20240703185059-mutt-send-email-mst@kernel.org>
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

Okay. But what exactly are the errno values we are going to use?

Also, how to we add errno values?

Parav, wouldn't you say the complexity is exploding, this
is a 1st new value in a very long while, maybe
the original approach is ok?

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

