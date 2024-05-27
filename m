Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F53381B1
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716800546; cv=none; b=M3xcyfx4COZmd4r+3s6ax4/dVf2sTG5wPtj+jNjFyEo5D8B6vjsTBzfZ/oqxvcSJLLXaIYFQk4oJgWy1wHuNq7hQNFTanG7ufwP3Wwgfd4hZMbkEaAXc+9D1dBPoctAvGya7SepbA6n7+o2oavrcaWHsNZdFKVXC+rinkAX86P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716800546; c=relaxed/simple;
	bh=y6ijxzEHX7goFxQHxFGJD4E/01N8K3s+GRS4/caxy3Y=;
	h=In-Reply-To:References:From:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuWGKj1hA3PBuuQwya8Vs7qANLj8JANdyy4W+d2l4H4lWPoP1ror8z1giaMNvO9BmBaCyeX3bmd5N2Ir5aF61ih48Jss9Gdur4Z3gpFUrfS5gFHE9JBlZ4n8krFguqIRZz4ITgwyFG0w6c4leuGlj/jRTe9Tw92FEX4pNZsrah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=krKo8g4D; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="krKo8g4D"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43df751b5b8so36716541cf.0
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716800543; x=1717405343; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:from:references
         :in-reply-to:user-agent:from:to:cc:subject:date:message-id:reply-to;
        bh=vwnWylwI9D8U7KlMatBjm04PmKk0WQGivH+WLj2Fzg0=;
        b=krKo8g4DdpwZ7RKGxShW398pBAoHNS1l5ZZsFZSE+PDStuZwBO0MTocO/HXoG/Yk7V
         34QBXe3io9b3sTA8sl8sHWIRVxU4IzgV1HDaJmHQKGyeaVcOvMHXqbatyhCeJUXRkUvf
         ZMbXykbPrqqPeP/EZKKVuUOvrwcU8RnbXVdhIUkc0Eu+a/2VQuqiYbkVCr5NJ1uVJK1B
         DBqKI70oGMil600LoYlh56qFDRVh7jb3fq2/ZEALCOwqk7/7wJTCZERq7Tj7O8WEr+rG
         Yu+gvM1HDyL1D5FVUMz6JWwW6y9NqVSjNkw9jzX1wRJw/VCfRuuZD2fW3QjrDm8rkWKB
         FEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716800543; x=1717405343;
        h=cc:to:subject:message-id:date:mime-version:from:references
         :in-reply-to:user-agent:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwnWylwI9D8U7KlMatBjm04PmKk0WQGivH+WLj2Fzg0=;
        b=eQUPUXtVBGbDnZ1pFfyKKJDABJAXUXm1QbqOUkOv97Sy8KT77WgzL3fgmXUOTo1euB
         RmkJy9iX1uIqtm5mzz8Uh9orRDp99yflvfUE+/N6ssaYoUn89jB6onFLQa7v7zUKwqGr
         h7JCQOntvvpJKegyfVkfPj9gvsRBZsbhD49JlaSqfP+GIzxZI6sUsZEF4LDWavU1w6z4
         LjPlWeCWbhYWld1bmRP/cq5Ub4VjfcWxt+x5imSNqeahuLV9OIc9O3IRORPhQSjP9rZY
         jNxQyevILYqpZ0HOmgNF8YW2WwKo8rFfHvRv9ogPMIFs42IjBwg3qFXGc/Rsqf7pA4ZG
         Pe7A==
X-Gm-Message-State: AOJu0YwQHCoUjRdJNnol/AFvdRAy1pWKuZmorJ3gT1dOYtZtDz6c71sR
	zuUmszce+RmHDLJHeKsCRnoLY7rkJ8Ge4BmP5KIBHs1AJwCJFSZHq6A+9SWAT/4fGv91pfGHP8N
	P3qZAUsk8glP/AZKhNGMvoNU15x/QsDqx/e1+bw==
X-Google-Smtp-Source: AGHT+IF9kMOzP/L9hOLgf/bRn73iqKFzIAnS7ENuEmFc6vztAsTeh2XNZvdsPmSGYtHD1f5S8M3RLvL2jD0Widu7qbs=
X-Received: by 2002:a05:622a:1214:b0:43e:3943:4379 with SMTP id
 d75a77b69052e-43fa746b206mr228448681cf.19.1716800542593; Mon, 27 May 2024
 02:02:22 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 27 May 2024 05:02:22 -0400
User-Agent: Mozilla Thunderbird
In-Reply-To: <20240527022424-mutt-send-email-mst@kernel.org>
X-Original-From: zhenwei pi <pizhenwei@bytedance.com>
References: <20240513121005.459013-1-pizhenwei@bytedance.com>
 <20240513121005.459013-2-pizhenwei@bytedance.com> <20240527022424-mutt-send-email-mst@kernel.org>
From: zhenwei pi <pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Mon, 27 May 2024 05:02:22 -0400
Message-ID: <CABoGon+epN7jPuumYAP501EBOG_e3Fc-e0odK3hcU+M5=aB-BQ@mail.gmail.com>
Subject: Re: Re: [PATCH 1/1] balloon: introduce 6 memory statistics
To: "Michael S. Tsirkin" <mst@redhat.com>, david@redhat.com
Cc: virtio-comment@lists.linux.dev
Content-Type: multipart/alternative; boundary="0000000000007df54b06196bc670"

--0000000000007df54b06196bc670
Content-Type: text/plain; charset="UTF-8"

On 5/27/24 14:37, Michael S. Tsirkin wrote:
> On Mon, May 13, 2024 at 08:10:05PM +0800, zhenwei pi wrote:
>> Expose more memory statistics of the virtual memory subsystem from
>> guest, it's helpful to analyze the memory performance and pressure
>> from host side.
>>
>> Signed-off-by: zhenwei pi
>> ---
>> device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
>> 1 file changed, 24 insertions(+)
>>
>> diff --git a/device-types/balloon/description.tex
b/device-types/balloon/description.tex
>> index a1d9603..bc8e109 100644
>> --- a/device-types/balloon/description.tex
>> +++ b/device-types/balloon/description.tex
>> @@ -305,6 +305,12 @@ \subsubsection{Memory Statistics}\label{sec:Device
Types / Memory Balloon Device
>> #define VIRTIO_BALLOON_S_CACHES 7
>> #define VIRTIO_BALLOON_S_HTLB_PGALLOC 8
>> #define VIRTIO_BALLOON_S_HTLB_PGFAIL 9
>> +#define VIRTIO_BALLOON_S_OOM_KILL 10
>> +#define VIRTIO_BALLOON_S_ALLOC_STALL 11
>> +#define VIRTIO_BALLOON_S_ASYNC_SCAN 12
>> +#define VIRTIO_BALLOON_S_DIRECT_SCAN 13
>> +#define VIRTIO_BALLOON_S_ASYNC_RECLAIM 14
>> +#define VIRTIO_BALLOON_S_DIRECT_RECLAIM 15
>> le16 tag;
>> le64 val;
>> } __attribute__((packed));
>> @@ -399,6 +405,24 @@ \subsubsection{Memory Statistics
Tags}\label{sec:Device Types / Memory Balloon D
>>
>> \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb
page
>> allocations in the guest.
>
>
> Would it make sense to reference
> https://docs.kernel.org/admin-guide/mm/concepts.html ?
> you seem to be using terminology from there.
> And then pls actually use terminology from there.
>

OK.

>
>> +
>> +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The number of Out-Of-Memory
killer
>> + invocations.
>
>
> What exactly are "invocations"? The number of times a task was killed
> to free memory?
>

What about:
The count of OOM killer invocations increases when the kernel invokes
the OOM killer. The OOM killer selects a task to terminate in order to
free up memory.

>> +
>> +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The number of stall count on
memory
>> + allocation.
>>
>
> count and number is mostly the same.
>
> Again what is this counting? pages? stalls? If stalls isn't this always
> the same as direct reclaim?
>

Once the memory pressure gets critical, a task hits ALLOC STALL, and
reclaims pages in batch directly. So the ALLOC STALL is not the same as
direct reclaim.

What about:
The count of stalls on memory allocation.


>> +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory that has
been
>> + scanned asynchronously (in bytes).
>
> scanned by what? which memory do you count as "scanned"?
>

What about:
The amount of memory scanned asynchronously by the kernel background
task (in bytes).

>> +
>> +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory that has
been
>> + scanned directly (in bytes).
>
> what is "scanned directly"?
>

The amount of memory scanned directly by the running task (in bytes).

>
>> +
>> +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory that
has been
>> + reclaimed asynchronously (in bytes).
>
> again reclaimed by what? free? evict?
>

The clean pages could be just freed, but the dirty pages need to write
back to the the backing storage device.('evict' is used in
https://docs.kernel.org/admin-guide/mm/concepts.html). They are
considered as 'reclaim'.

What about:
The amount of memory reclaimed asynchronously by the kernel background
task (in bytes).

>> +
>> +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory that
has been
>> + reclaimed directly (in bytes).
>> \end{description}
>>

What about:
The amount of memory reclaimed directly by the running task (in bytes).

>> \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory
Balloon Device / Device Operation / Free Page Hinting}
>> --
>> 2.34.1
>>
>

-- 
zhenwei pi

--0000000000007df54b06196bc670
Content-Type: text/html; charset="UTF-8"

<p>On 5/27/24 14:37, Michael S. Tsirkin wrote:
<br>&gt; On Mon, May 13, 2024 at 08:10:05PM +0800, zhenwei pi wrote:
<br>&gt;&gt; Expose more memory statistics of the virtual memory subsystem from
<br>&gt;&gt; guest, it&#39;s helpful to analyze the memory performance and pressure
<br>&gt;&gt; from host side.
<br>&gt;&gt;
<br>&gt;&gt; Signed-off-by: zhenwei pi 
<br>&gt;&gt; ---
<br>&gt;&gt;  device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
<br>&gt;&gt;  1 file changed, 24 insertions(+)
<br>&gt;&gt;
<br>&gt;&gt; diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
<br>&gt;&gt; index a1d9603..bc8e109 100644
<br>&gt;&gt; --- a/device-types/balloon/description.tex
<br>&gt;&gt; +++ b/device-types/balloon/description.tex
<br>&gt;&gt; @@ -305,6 +305,12 @@ \subsubsection{Memory Statistics}\label{sec:Device Types / Memory Balloon Device
<br>&gt;&gt;  #define VIRTIO_BALLOON_S_CACHES   7
<br>&gt;&gt;  #define VIRTIO_BALLOON_S_HTLB_PGALLOC 8
<br>&gt;&gt;  #define VIRTIO_BALLOON_S_HTLB_PGFAIL  9
<br>&gt;&gt; +#define VIRTIO_BALLOON_S_OOM_KILL       10
<br>&gt;&gt; +#define VIRTIO_BALLOON_S_ALLOC_STALL    11
<br>&gt;&gt; +#define VIRTIO_BALLOON_S_ASYNC_SCAN     12
<br>&gt;&gt; +#define VIRTIO_BALLOON_S_DIRECT_SCAN    13
<br>&gt;&gt; +#define VIRTIO_BALLOON_S_ASYNC_RECLAIM  14
<br>&gt;&gt; +#define VIRTIO_BALLOON_S_DIRECT_RECLAIM 15
<br>&gt;&gt;          le16 tag;
<br>&gt;&gt;          le64 val;
<br>&gt;&gt;  } __attribute__((packed));
<br>&gt;&gt; @@ -399,6 +405,24 @@ \subsubsection{Memory Statistics Tags}\label{sec:Device Types / Memory Balloon D
<br>&gt;&gt;  
<br>&gt;&gt;  \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb page
<br>&gt;&gt;    allocations in the guest.
<br>&gt; 
<br>&gt; 
<br>&gt; Would it make sense to reference
<br>&gt; <a href="https://docs.kernel.org/admin-guide/mm/concepts.html">https://docs.kernel.org/admin-guide/mm/concepts.html</a> ?
<br>&gt; you seem to be using terminology from there.
<br>&gt; And then pls actually use terminology from there.
<br>&gt; 
<br>
<br>OK.
<br>
<br>&gt; 
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The number of Out-Of-Memory killer
<br>&gt;&gt; +  invocations.
<br>&gt; 
<br>&gt; 
<br>&gt; What exactly are &quot;invocations&quot;? The number of times a task was killed
<br>&gt; to free memory?
<br>&gt; 
<br>
<br>What about:
<br>The count of OOM killer invocations increases when the kernel invokes
<br>the OOM killer. The OOM killer selects a task to terminate in order to
<br>free up memory.
<br>
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The number of stall count on memory
<br>&gt;&gt; +  allocation.
<br>&gt;&gt;
<br>&gt; 
<br>&gt; count and number is mostly the same.
<br>&gt; 
<br>&gt; Again what is this counting? pages? stalls? If stalls isn&#39;t this always
<br>&gt; the same as direct reclaim?
<br>&gt; 
<br>
<br>Once the memory pressure gets critical, a task hits ALLOC STALL, and
<br>reclaims pages in batch directly. So the ALLOC STALL is not the same as
<br>direct reclaim.
<br>
<br>What about:
<br>The count of stalls on memory allocation.
<br>
<br>
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory that has been
<br>&gt;&gt; +  scanned asynchronously (in bytes).
<br>&gt; 
<br>&gt; scanned by what? which memory do you count as &quot;scanned&quot;?
<br>&gt; 
<br>
<br>What about:
<br>The amount of memory scanned asynchronously by the kernel background
<br>task (in bytes).
<br>
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory that has been
<br>&gt;&gt; +  scanned directly (in bytes).
<br>&gt; 
<br>&gt; what is &quot;scanned directly&quot;?
<br>&gt; 
<br>
<br>The amount of memory scanned directly by the running task (in bytes).
<br>
<br>&gt; 
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory that has been
<br>&gt;&gt; +  reclaimed asynchronously (in bytes).
<br>&gt; 
<br>&gt; again reclaimed by what? free? evict?
<br>&gt; 
<br>
<br>The clean pages could be just freed, but the dirty pages need to write
<br>back to the the backing storage device.(&#39;evict&#39; is used in
<br><a href="https://docs.kernel.org/admin-guide/mm/concepts.html">https://docs.kernel.org/admin-guide/mm/concepts.html</a>). They are
<br>considered as &#39;reclaim&#39;.
<br>
<br>What about:
<br>The amount of memory reclaimed asynchronously by the kernel background
<br>task (in bytes).
<br>
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory that has been
<br>&gt;&gt; +  reclaimed directly (in bytes).
<br>&gt;&gt;  \end{description}
<br>&gt;&gt;  
<br>
<br>What about:
<br>The amount of memory reclaimed directly by the running task (in bytes).
<br>
<br>&gt;&gt;  \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
<br>&gt;&gt; -- 
<br>&gt;&gt; 2.34.1
<br>&gt;&gt;
<br>&gt; 
<br>
<br>-- 
<br>zhenwei pi</p>

--0000000000007df54b06196bc670--
