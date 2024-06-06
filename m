Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A879132494
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717655863; cv=none; b=bCgZFQNkpyjM3sgA8cLm8c6FRzqYTYQibeHsLXt2fxX+L5c+PuBNhAzZhbIa30dph8SpD/9ieMTiMTRPqD3L9nyXNAaMranMmP95mQ4e6DICMba5k3ioBInvyAQIaNm8Lv9+O/AukvKMDAhdHndxH+vv4i+UD5sPXi4lf1/1hrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717655863; c=relaxed/simple;
	bh=JLXRVEQ5VXABhNaqCc7VBAMbFs4BfDcgB3L1Qy5pUoU=;
	h=From:Mime-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AP3E6V5baJsbimpN0fJGX6Uw7pIAky99iylu9IyOpwS90xf173KjkNmSzKd5jITGnD/7QAR5VdS0bML9lV1Ajm5QTjqEW6VvHecHTCOJFGgkPsmvfxPfA6dtzjQWmmc2Y0qLYGoMREQDJCJpUxzHjk2rmjpzpUUyWTsJ5nu3taY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Gi3z8yeN; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Gi3z8yeN"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-43fbbd1eb0cso3134451cf.2
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 23:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717655860; x=1718260660; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cY28XUK1u/4W52/Cll3cxOgmLLfftBX6uog1ps69pIo=;
        b=Gi3z8yeNUISkvpe0Nj/3y4RPE9lTldQN+oBGzhusGWVCG0nViytfuTLq6JlrNt8N+Y
         sE0wacuMAyho03yZP5VN1A15TEt9ItoCXZ7YlXV4NLn+EajrbdNOr5f8EccGBtCxPFYt
         daq4l4wPtd+e33PXU1dXM34vDTnbSwSmVaos/fAsjNB6rONe4VDOkDRPWAz6SF/BsoPp
         Y9DP97QfBVy8E/fjy22X3tuBmYVw6o/QqpzYbAio9CxMGvVAt63aCjHjf9biEVK7+3XZ
         v15KGl3PsMXV21l2/i9vlwX1uyCU3r3dni528xit+c6Cr+AlxtiNplyZIX9CTQRgqelI
         f+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717655860; x=1718260660;
        h=cc:to:subject:message-id:date:user-agent:references:in-reply-to
         :mime-version:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cY28XUK1u/4W52/Cll3cxOgmLLfftBX6uog1ps69pIo=;
        b=oze6Y5LzqXaO66JRF9KwEV5a3TTqEOtm40F4EbRwiVMj+eLUVkqCAl0UxRn6I/Zy52
         ZeAhG6mZehwO/lfkG86/1LQx8mLK7pUibffGELMQSCtZZqIS+1UzX288BsBhe5xFLHkK
         nKfARPUHkbVODGoK4Zos1wdsTAP5qHJjqb1uqc0iNVI/RS4VHMM4zB71bX2lu5DEmWFf
         0aG2jmATJUwf5bBccMA37GAnpZjz1k4yGbLo8aJ53SdEsoh2bPW6ahqj0EowG1huvDSH
         jTbZ6NjVvIFps2s4sRBkdLH4gHw15eIiqXc4w77cKzfit34lHmxQD32wvSEVfiWDzZ7D
         wcVw==
X-Gm-Message-State: AOJu0Yw5oJb6GxOen9eJkGhukCiLLx1CesgbmVlcSHrP4QtjiVuYGeF/
	IMa50x5ZsVXR97D614rY4tblhjS+BHsAK8hYdRhE8RCysMp1QAncOEqsKjLI0UiFsYC/P+E/Evq
	76XJ6Yt4kbTcixrcRo9An6EBVukWPQ6vPJ6xLrIGGTd7U3DrY
X-Google-Smtp-Source: AGHT+IG98aMKGD/JCa36YmLRctJ0EcbDppRV/Pu2kTwsqzFWHiVanH/jICKQ4W8xZ6p7TPVjFk5freMm9vL9B56V+iE=
X-Received: by 2002:ac8:5f46:0:b0:43a:f1ef:fd8d with SMTP id
 d75a77b69052e-4402b58b132mr55967921cf.1.1717655860191; Wed, 05 Jun 2024
 23:37:40 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 5 Jun 2024 23:37:39 -0700
From: zhenwei pi <pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
In-Reply-To: <20240606020800-mutt-send-email-mst@kernel.org>
References: <20240606033544.400000-1-pizhenwei@bytedance.com>
 <20240606033544.400000-2-pizhenwei@bytedance.com> <20240606020800-mutt-send-email-mst@kernel.org>
User-Agent: Mozilla Thunderbird
X-Original-From: zhenwei pi <pizhenwei@bytedance.com>
Date: Wed, 5 Jun 2024 23:37:39 -0700
Message-ID: <CABoGonKBkf25RPZyVpFXLN87VHQhVVLyk00w5wqqbzCmsYYJVA@mail.gmail.com>
Subject: Re: Re: [PATCH v2 1/2] balloon: introduce 6 memory statistics
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, david@redhat.com
Content-Type: multipart/alternative; boundary="00000000000064bd69061a32eb6a"

--00000000000064bd69061a32eb6a
Content-Type: text/plain; charset="UTF-8"

On 6/6/24 14:09, Michael S. Tsirkin wrote:
> On Thu, Jun 06, 2024 at 11:35:43AM +0800, zhenwei pi wrote:
>> Note that virtio balloon statistics are OS independent, the names are
[SNIP]
>> \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb
page
>> allocations in the guest.
>> +
>> +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The count of OOM killer
invocations
>> + increases when the kernel invokes the OOM killer. The OOM killer
selects a task
>> + to terminate in order to free up memory.
>> +
>> +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The count of stalls on memory
allocation.
>> +
>> +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory scanned
asynchronously
>> + by the kernel background task (in bytes).
>> +
>> +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory scanned
directly by
>> + the running task (in bytes).
>> +
>> +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory
reclaimed
>> + asynchronously by the kernel background task (in bytes).
>> +
>> +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory
reclaimed
>> + directly by the running task (in bytes).
>> \end{description}
>
> OOM kill description is unnecessarily verbose, the rest not very clear,
> and not consistent with existing stats.
>

Hi Michael,

You asked 'What exactly are "invocations"? The number of times a task
was killed to free memory?' in the previous version, would you please
give me an example, and any example of the rest?


>
>> \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory
Balloon Device / Device Operation / Free Page Hinting}
>> --
>> 2.43.0
>>
>

-- 
zhenwei pi

--00000000000064bd69061a32eb6a
Content-Type: text/html; charset="UTF-8"

<p>On 6/6/24 14:09, Michael S. Tsirkin wrote:
<br>&gt; On Thu, Jun 06, 2024 at 11:35:43AM +0800, zhenwei pi wrote:
<br>&gt;&gt; Note that virtio balloon statistics are OS independent, the names are
<br>[SNIP]
<br>&gt;&gt;  \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb page
<br>&gt;&gt;    allocations in the guest.
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The count of OOM killer invocations
<br>&gt;&gt; +  increases when the kernel invokes the OOM killer. The OOM killer selects a task
<br>&gt;&gt; +  to terminate in order to free up memory.
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The count of stalls on memory allocation.
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory scanned asynchronously
<br>&gt;&gt; +  by the kernel background task (in bytes).
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory scanned directly by
<br>&gt;&gt; +  the running task (in bytes).
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory reclaimed
<br>&gt;&gt; +  asynchronously by the kernel background task (in bytes).
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory reclaimed
<br>&gt;&gt; +  directly by the running task (in bytes).
<br>&gt;&gt;  \end{description}
<br>&gt; 
<br>&gt; OOM kill description is unnecessarily verbose, the rest not very clear,
<br>&gt; and not consistent with existing stats.
<br>&gt; 
<br>
<br>Hi Michael,
<br>
<br>You asked &#39;What exactly are &quot;invocations&quot;? The number of times a task
<br>was killed to free memory?&#39; in the previous version, would you please
<br>give me an example, and any example of the rest?
<br>
<br>
<br>&gt; 
<br>&gt;&gt;  \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
<br>&gt;&gt; -- 
<br>&gt;&gt; 2.43.0
<br>&gt;&gt;
<br>&gt; 
<br>
<br>-- 
<br>zhenwei pi</p>

--00000000000064bd69061a32eb6a--
