Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A02572
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719312217; cv=none; b=PeVvXy8MievtOJ7PMX9uYCKeaP746faGc/aD6/3+62oAiCLwxS0L58bd+MOVctUJGWd2HfmvZ6rnhoBbwUcXqXBqklib1rYb3UD6EbQA7Zq5jzn4NiVBVpW23fnB8xWeMm2NFtBpkmfTsTj/Hc1WBh+cDlr8fq0Yi05H4N+kqT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719312217; c=relaxed/simple;
	bh=RqRg0kFnmCuJ6Z2ZY/7zRHvtb0/hOSQS8o2Tr60KKTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gK5kbTEOSkjP2Jl5pUneJyozdEIKd9qVNTuSibTTYhHsXnwSMDPAxe/xRJwytMG5nFoI/dLxVAz1f+hanTqqT2x2PNw26Hx1rvUMgd6PyCEHjEEHkUB9RLqKGobyIBZ7Oj/tpcS/6oAWch9L0arSLmT5bk1n+0NPl1mOwL3LhpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7bs7h3O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7bs7h3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719312214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iN0EsLjkgJ1wuwqZ3k+fiEpGnXIbKskGCJCb8yCW6NA=;
	b=Q7bs7h3OY81YBRcaOW4Jitf7MDO4MyQ3VV87OaDopVQh3CpzmcVJLjSIauezhnLQnuSzO7
	V2zE67gfYat8Zfk7OjpUgX4T+hA+57lOts+SrYVwAdJ7WHxXv4RDD2hdOREPozbUA0cUgF
	49A1h9f+4siuCIDkFr7bOIFO0jTXp8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-WSdO7Na0Mh2l98_qt4rMBQ-1; Tue, 25 Jun 2024 06:43:33 -0400
X-MC-Unique: WSdO7Na0Mh2l98_qt4rMBQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-424a5a5f024so1503455e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 03:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719312212; x=1719917012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iN0EsLjkgJ1wuwqZ3k+fiEpGnXIbKskGCJCb8yCW6NA=;
        b=qKKVOwnl+669OtknHYrM1RTIOc8o3tZWG3TwZR/nPDEnVqfQi6K5Z0laPBJuFSxcNi
         0I+4ZkNhV9EhgqldGL2xNTqC5Yt7BWEiPRLGYzK/FfYZMnS7zhZX39Rj+cggDYRgA2rB
         Q8qKV/3bg2b8uGjzEHI4Nf08mmayYpdG7MnvUt1VM/CT99GHSybB2SuXTOR9/ixbgZlS
         bVbHMkQ+X0zNdOEBoyhRWTzBU8rBeDtC5uZ5Wmo9UJ4MsUmdIhK/rd1TKngeAFiYn2q4
         YNdLie1QZt3IGOd8gSm6vGMPNlKFlyjZZL9zMBZVYrlVDLR0FiMg06cTKElRYpTlHevL
         ynhQ==
X-Gm-Message-State: AOJu0Yxc3J5nQqgWwKwwy7Mugk5i1AWojCP99eZ2FPtovNX0eGoetm9d
	ibjsUBGO2eT/LJZbtj3GpwKCjPbV+C8gd8PDGww4AG/nR1lU9TqRfQr/o3TbwZMc2w7cxq+UT9D
	RNkjMvhS/cx7IU7a53BjQJfbm/3c+H6q2ZtI4gHDFhbmDENfPcMLnEnc7AoZLwr+9
X-Received: by 2002:a05:600c:2d06:b0:423:366:ad3d with SMTP id 5b1f17b1804b1-4248cc2acf7mr51539215e9.13.1719312211922;
        Tue, 25 Jun 2024 03:43:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENFCANv8e6TnHRtjOUmCGr487rHe8Ofcza41LuBzO1ox1uxFLlVeYKJFjTPNjtIua2ODg+zQ==
X-Received: by 2002:a05:600c:2d06:b0:423:366:ad3d with SMTP id 5b1f17b1804b1-4248cc2acf7mr51539095e9.13.1719312211547;
        Tue, 25 Jun 2024 03:43:31 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910f91sm166419405e9.38.2024.06.25.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:43:31 -0700 (PDT)
Date: Tue, 25 Jun 2024 12:43:29 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, anton.yakovlev@opensynergy.com,
	sgarzare@redhat.com
Subject: Re: [PATCH v1 Resend] virtio-sound: add latency_bytes definition
Message-ID: <ZnqfUUp8dRjF8uDH@fedora>
References: <Zky3vZU+P37H4VPb@fedora>
 <ZnWCGR9tkSrKPzX2@fedora>
 <20240621095414-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240621095414-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 21, 2024 at 09:56:16AM -0400, Michael S. Tsirkin wrote:
> On Fri, Jun 21, 2024 at 03:37:29PM +0200, Matias Ezequiel Vara Larsen wrote:
> > On Tue, May 21, 2024 at 05:03:25PM +0200, Matias Ezequiel Vara Larsen wrote:
> > > This commit aims at providing a better definition of latency_bytes. To
> > > do so, this commit defines latency_bytes as is defined in Crosvm.
> > > 
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > ---
> > > Changelog:
> > > v0 -> v1:
> > >  * specify that the delay is due to the device implementation.
> > > ---
> > >  device-types/sound/description.tex | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> > > index 54c9c8e..a138e5b 100644
> > > --- a/device-types/sound/description.tex
> > > +++ b/device-types/sound/description.tex
> > > @@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
> > >  \begin{description}
> > >  \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
> > >  and VIRTIO_SND_S_IO_ERR otherwise.
> > > -\item[\field{latency_bytes}] indicates the current device latency.
> > > +\item[\field{latency_bytes}] indicates the current additional delay caused by
> > > +the device's implementation. For playback, this is the amount of bytes that
> > > +must be consumed before the current request can be played. For capture, this is
> > > +the latency in terms of bytes that the capture buffer was recorded.
> 
> 
> the last "was recorded" seems agrammatical. Do you mean "has recorded"?
> 

When the device processes a period, e.g. multiples descriptors, it puts
it in the used queue, sets the latency_bytes and notifies the driver.
For playback, the latency_bytes contains the number of bytes until the
buffer is actually played, e.g., if the device notifies the driver just
before playing it the value would be 0. For capture, the latency_bytes
is the number of bytes that `has elapsed` since the buffer has been
recorded. Coming back to your comment, I could rephrase it as:

`During capture, this is the number of bytes since the buffer was
recorded.`

WDYT?

> > >  \end{description}
> > >  
> > >  Since all buffers in the queue (with one exception) should be of the size
> > > -- 
> > > 2.41.0
> > > 
> > Dear TC,
> > 
> > I'd like to request a vote on solving issue 198.
> > 
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/198
> > 
> > Matias
> 
> 
> OK. Can you pls add a bit more detail about the issue and
> the proposal in github?
>
Yes, I can. Thanks.

Matias.

