Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91A1E51D
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658258; cv=none; b=UdCbc0jt2GAB0a+ffzGFZMI7yGx1h5CMFDgzSg3fq5/OA50oZhjv6UViPto5N6knvlZ9FsJ9mmdRopS/ebDPROXSUCrRPLOT/vLFKVwwEz18Gm5mQ6EwUDgY58HQX091AavwgFCOA+PWtHqYxiTfHrAlCfM8gFWGyLyyDtasI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658258; c=relaxed/simple;
	bh=ITtFy3DyZG2DbGqKAwe5VKim9CSMqTWrGs7yjMrWHGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ivEDbGbhb9Jp9IkVrwS+OP+LSp8hk0nboPEzOVBtPoTxqNdmADzZ8EThuacmkx/iRfZX04piWgb0N6QD4U8h6bNgO2cPtWwWII5YCt8FcLcJeiQljIPYhSBeME3/Kh0nH6fLQGQca1bEwuDMs/0XcoiUijUU/ZzlSkHZCrohu0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmA3qZGD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmA3qZGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717658255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LyF/E7p17CBgCObpRltQ8H62iHZKwvQ5SvDixW+eAaU=;
	b=HmA3qZGDtBKmgRYYKkoIH24rvlY96eElT8K+Op2F5C5Q8nbOSbZskd8wKNKsdFCQD2vgn8
	JrSSdMn8PbK6m+uYtHcVJmqI92hKmq0VLKNp5rr4W/xZrpsnn4CalMXJdeMW5mMdqSpBdx
	b09pZA4fbhNxij3tf+uN3lkOF5bFypk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-DfPs_fi8NZStKGjyArOeqA-1; Thu, 06 Jun 2024 03:17:33 -0400
X-MC-Unique: DfPs_fi8NZStKGjyArOeqA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6861bb1c0bso33005266b.3
        for <virtio-comment@lists.linux.dev>; Thu, 06 Jun 2024 00:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658252; x=1718263052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyF/E7p17CBgCObpRltQ8H62iHZKwvQ5SvDixW+eAaU=;
        b=X1LHAby2wb6B0wX0uJ2Mcsk+WwwAHer9Wu/RAXJU4eKKirI9GnixWHmKvnbdVKAES/
         x6y3ciLNozkmuV+QogW6egPGme4P1Js9yGH61yc262652hHTwU3ulbtCorGAzZ9BKwqX
         T5wHxBs0Yc+lvsjUBb0s5rSsM/DLl8QX6svLxt9RA+nMTaJ/Vo8Rq9S9CXhJsNRVyjPu
         7YZUpeLtUaMckLE54QUzHo1XpuI39RcCG2TgiOJQKnEicccHZyWwH7RBlNME9SaUdf5k
         VwuE5SsulCQFGEDLxYu2O6xsyUFmgqLL19w1EcQ1MW4NBlF3NEkOunyzuwhx4Lc2GK/V
         8sUw==
X-Gm-Message-State: AOJu0YzQjzQnhQ9M38JjcYZ9zjDbsvQJViUrtVtDPeTy3ReMKQrG1/Kv
	ej1gC4+eogfDJJjRR1aLaKDm2yc8gUB3GXG7XFMp/WAoMwwHmlZ54YKAguNyWGTJU1ojDYirvNt
	+uwC/LrNy7Hu6uUTyXOXZARE/QefhnXK5uB/apX53KkWnUUdVALdnfT5TPSP/5elZ
X-Received: by 2002:a17:907:7754:b0:a69:9dd2:c8fb with SMTP id a640c23a62f3a-a699f67ecb0mr287337966b.42.1717658252221;
        Thu, 06 Jun 2024 00:17:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7K0tbLt/I1+fZdoCDv4lScR5iAS8W+zlUQg9y1NHll/mPg+Af4Z0cNE0ol/NYYmrq1eP46Q==
X-Received: by 2002:a17:907:7754:b0:a69:9dd2:c8fb with SMTP id a640c23a62f3a-a699f67ecb0mr287336366b.42.1717658251648;
        Thu, 06 Jun 2024 00:17:31 -0700 (PDT)
Received: from redhat.com ([2.55.8.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805c9662sm54056266b.51.2024.06.06.00.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:17:31 -0700 (PDT)
Date: Thu, 6 Jun 2024 03:17:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.linux.dev, david@redhat.com
Subject: Re: Re: [PATCH v2 1/2] balloon: introduce 6 memory statistics
Message-ID: <20240606030548-mutt-send-email-mst@kernel.org>
References: <20240606033544.400000-1-pizhenwei@bytedance.com>
 <20240606033544.400000-2-pizhenwei@bytedance.com>
 <20240606020800-mutt-send-email-mst@kernel.org>
 <CABoGonKBkf25RPZyVpFXLN87VHQhVVLyk00w5wqqbzCmsYYJVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABoGonKBkf25RPZyVpFXLN87VHQhVVLyk00w5wqqbzCmsYYJVA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2024 at 11:37:39PM -0700, zhenwei pi wrote:
> On 6/6/24 14:09, Michael S. Tsirkin wrote:
> > On Thu, Jun 06, 2024 at 11:35:43AM +0800, zhenwei pi wrote:
> >> Note that virtio balloon statistics are OS independent, the names are
> [SNIP]
> >> \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb page
> >> allocations in the guest.
> >> +
> >> +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The count of OOM killer invocations
> >> + increases when the kernel invokes the OOM killer. The OOM killer selects a
> task
> >> + to terminate in order to free up memory.
> >> +
> >> +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The count of stalls on memory
> allocation.
> >> +
> >> +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory scanned
> asynchronously
> >> + by the kernel background task (in bytes).
> >> +
> >> +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory scanned
> directly by
> >> + the running task (in bytes).
> >> +
> >> +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory reclaimed
> >> + asynchronously by the kernel background task (in bytes).
> >> +
> >> +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory reclaimed
> >> + directly by the running task (in bytes).
> >> \end{description}
> >
> > OOM kill description is unnecessarily verbose, the rest not very clear,
> > and not consistent with existing stats.
> >
> 
> Hi Michael,
> 
> You asked 'What exactly are "invocations"? The number of times a task
> was killed to free memory?' in the previous version, would you please
> give me an example,


Well consider what you write:

	\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The count of OOM killer invocations
	increases when the kernel invokes the OOM killer.

this does not explain anything. You just repeat same thing twice.  I asked
what are invocations, your patch does not answer.  If the answer is "the
number of times a task was killed to free memory" then say so, that
would be an explanation.

> and any example of the rest?


Example of not clear:
 What is "the running task" you refer to? What are "stalls" what is stalled?
 The text seems to be agrammatical, using "the" the first time a concept is
 introduced.

Example of inconsistency:
	For example, "the kernel" is not a thing we ever defined.
	We do say "the guest" in balloon description (it is fundamentally a PV
	device and so special in that way).


But please try to think of a reader coming at this for the first time,
reading the whole chapter, not just your patch
and attempting to understand what each of the things is.
Do not just fix the examples I pointed out.
Getting a tech writer to read your text and give feedback is often a good idea.



> >
> >> \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon
> Device / Device Operation / Free Page Hinting}
> >> --
> >> 2.43.0
> >>
> >
> 
> --
> zhenwei pi
> 

