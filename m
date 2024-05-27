Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906BF1A2C37
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 03:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716780882; cv=none; b=J7haIngETOcAzsyxYvXazm8D6AWmNxtigm6WzSda6U0eTFXcxlpzYXCwb5svTqh6kpv2U5/NG3DX54dYX8sZr148MfmFsm27FnClrtSNBXqyTFR+gMBzPZc9WkqdmcW4OXMOOMe9OnUpWDmEEuEuLlED10mIzwJc3itTf8KidBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716780882; c=relaxed/simple;
	bh=HmM5VrIiGVsmtNrWJkPmayplj4oz0e2ZEaJBDGOZ3Ak=;
	h=References:In-Reply-To:From:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQzyRejVv7S5HNHiElo7o2gnpcKz9YuBR+Izv14Yuy7H5d7/lLDJ9ZwZBDSfVoDmZ7jNtqR1F/hjhakyBHnZQ6KWEGV4LQ+PbiTW1AN+g4sPLrcM2WvYLjUrBMhql655l9x2pySG5qoEdaLQrH6Zb3t11Nl5oVUUgiA1/XjybUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=T5D6npaZ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="T5D6npaZ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43f84f53f56so29116261cf.0
        for <virtio-comment@lists.linux.dev>; Sun, 26 May 2024 20:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716780879; x=1717385679; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :in-reply-to:references:from:to:cc:subject:date:message-id:reply-to;
        bh=LkJB8Bdq3ydHNJBU+Ckh35wWExKM44J6I85iIKrms04=;
        b=T5D6npaZjGNQFJeSp5gqFHoMm34RETOkhcNfs7snYHp1hfMV7wNQLvRirccjCEivei
         gxbji1AUKGPwYgrYobSHS6vf4hMgl+z8Xjx9AHxIdnVUX5ug97ikHApz+LLoNcpPPIxU
         faMfvG6H5CDPWQ0SanO6/3LSXuJqCVR1kMMpZ25v4+rc+VR+5Wq+cEJYRL/P1BSUuJ3U
         hTY4ihM1hpMk+3vSaVXRE25h4/SSEym/r3E59LwsnSXvZXSGtROZxM2XTIMiaZO+YC+7
         3oHZOIrMxsKL/Tedfs8yOF4EGT4RPloElxdCpNKHCIsyDecFeHih+PIqyLjZGwQ0RiTx
         fBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716780879; x=1717385679;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :in-reply-to:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkJB8Bdq3ydHNJBU+Ckh35wWExKM44J6I85iIKrms04=;
        b=kc/EQ9Vp0yIiyFW2DV0E9HNiRLEIFb+uiaUztWb0BOUXYhdn40DsyJtxirjx/uAgvm
         aF0UFXm6xL400U9tUuM5DKKeyibTgwd08ZVT4D4m+RVCwAFHNjQl38FAV7t6fuDQTs8H
         q3DPzHL4c7Uh62GXwEAc/XfVrZQIMKcKfar25OMwAy4bWyYv3klIJGd94vMv0aOpj2OB
         ISx5eSufDuZXUc7ANSKpeLRL/mKWpHJq8TFWz3MQQbvv5QNJmzaT2AStw7wL+qxVOqJX
         XW09p9ayxtK0ZUryNaOFe/QaatIyLu4JDw8eY9yDAkqOkeWFKN+40mB0Yc/Ys6zVL7Ay
         EHhw==
X-Gm-Message-State: AOJu0Yz29gGm7omkaJMbFiURiVaSKhixkqqii/wM8YTAUebYDjBpq8bo
	jntojQ2sn9YGHSXVnEfn6QWYhHp+E3UdtHUCERtUU2viESH3Ztm/LbIDtCUaqRZPuw1sale/tFG
	Mt2JTXwI4Z9ZqsXTW7w9B4h6kMPjNqAK3Wwaumw==
X-Google-Smtp-Source: AGHT+IECZejVqsDcRKL/tffXqhiHYbgQRff9DqgTGDKAWOKtAgdEDt4A8ropFjLA0BPH9f1rUqhVajqMxuSEvmeM4kU=
X-Received: by 2002:ac8:5f89:0:b0:43d:f37a:dbe4 with SMTP id
 d75a77b69052e-43fb0e3f3b9mr110512731cf.8.1716780879457; Sun, 26 May 2024
 20:34:39 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 26 May 2024 23:34:38 -0400
X-Original-From: zhenwei pi <pizhenwei@bytedance.com>
References: <20240513121005.459013-1-pizhenwei@bytedance.com>
 <20240513121005.459013-2-pizhenwei@bytedance.com> <20240520234857-mutt-send-email-mst@kernel.org>
 <db3b8a29-db67-4e85-9b2d-314cb2924c88@bytedance.com>
In-Reply-To: <db3b8a29-db67-4e85-9b2d-314cb2924c88@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Sun, 26 May 2024 23:34:38 -0400
Message-ID: <CABoGon+hrvp80k02QEY7h1w9m6Mr2jZVdXDq-uxy5Zd9KM+MEQ@mail.gmail.com>
Subject: PING: [PATCH 1/1] balloon: introduce 6 memory statistics
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, david@redhat.com
Content-Type: multipart/alternative; boundary="0000000000007a54e6061967326d"

--0000000000007a54e6061967326d
Content-Type: text/plain; charset="UTF-8"

On 5/21/24 12:56, zhenwei pi wrote:
> Hi Michael,
>
> Sorry, I received this text, but read that email from my mobile phone
> carelessly.
>
> On 5/21/24 11:50, Michael S. Tsirkin wrote:
>> On Mon, May 13, 2024 at 08:10:05PM +0800, zhenwei pi wrote:
>>> Expose more memory statistics of the virtual memory subsystem from
>>> guest, it's helpful to analyze the memory performance and pressure
>>> from host side.
>>>
>>> Signed-off-by: zhenwei pi
>>
>> zhenwei
>>
>> when subsriving to the lists you should have received this text:
>>
>>
>> Not to do:
>> - copy both virtio-dev and virtio-comment mailing lists (instead, pick
>> one)
>>
>> did you not get this text? was this, somehow, unclear that you copied
> both
>> virtip-comment and virtio-dev on your patch?
>>
>>
>>> ---
>>> device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
>>> 1 file changed, 24 insertions(+)
>>>
>>> diff --git a/device-types/balloon/description.tex
> b/device-types/balloon/description.tex
>>> index a1d9603..bc8e109 100644
>>> --- a/device-types/balloon/description.tex
>>> +++ b/device-types/balloon/description.tex
>>> @@ -305,6 +305,12 @@ \subsubsection{Memory
> Statistics}\label{sec:Device Types / Memory Balloon Device
>>> #define VIRTIO_BALLOON_S_CACHES 7
>>> #define VIRTIO_BALLOON_S_HTLB_PGALLOC 8
>>> #define VIRTIO_BALLOON_S_HTLB_PGFAIL 9
>>> +#define VIRTIO_BALLOON_S_OOM_KILL 10
>>> +#define VIRTIO_BALLOON_S_ALLOC_STALL 11
>>> +#define VIRTIO_BALLOON_S_ASYNC_SCAN 12
>>> +#define VIRTIO_BALLOON_S_DIRECT_SCAN 13
>>> +#define VIRTIO_BALLOON_S_ASYNC_RECLAIM 14
>>> +#define VIRTIO_BALLOON_S_DIRECT_RECLAIM 15
>>> le16 tag;
>>> le64 val;
>>> } __attribute__((packed));
>>> @@ -399,6 +405,24 @@ \subsubsection{Memory Statistics
> Tags}\label{sec:Device Types / Memory Balloon D
>>>
>>> \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb
> page
>>> allocations in the guest.
>>> +
>>> +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The number of Out-Of-Memory
> killer
>>> + invocations.
>>> +
>>> +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The number of stall count
> on memory
>>> + allocation.
>>> +
>>> +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory that
> has been
>>> + scanned asynchronously (in bytes).
>>> +
>>> +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory that
> has been
>>> + scanned directly (in bytes).
>>> +
>>> +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory that
> has been
>>> + reclaimed asynchronously (in bytes).
>>> +
>>> +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory
> that has been
>>> + reclaimed directly (in bytes).
>>> \end{description}
>>>
>>> \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory
> Balloon Device / Device Operation / Free Page Hinting}
>>> --
>>> 2.34.1
>>>
>>
>
> --
> zhenwei pi
>

-- 
zhenwei pi

--0000000000007a54e6061967326d
Content-Type: text/html; charset="UTF-8"

<p>On 5/21/24 12:56, zhenwei pi wrote:
<br>&gt; Hi Michael,
<br>&gt; 
<br>&gt; Sorry, I received this text, but read that email from my mobile phone
<br>&gt; carelessly.
<br>&gt; 
<br>&gt; On 5/21/24 11:50, Michael S. Tsirkin wrote:
<br>&gt;&gt; On Mon, May 13, 2024 at 08:10:05PM +0800, zhenwei pi wrote:
<br>&gt;&gt;&gt; Expose more memory statistics of the virtual memory subsystem from
<br>&gt;&gt;&gt; guest, it&#39;s helpful to analyze the memory performance and pressure
<br>&gt;&gt;&gt; from host side.
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; Signed-off-by: zhenwei pi
<br>&gt;&gt;
<br>&gt;&gt; zhenwei
<br>&gt;&gt;
<br>&gt;&gt; when subsriving to the lists you should have received this text:
<br>&gt;&gt;
<br>&gt;&gt;
<br>&gt;&gt; Not to do:
<br>&gt;&gt; - copy both virtio-dev and virtio-comment mailing lists (instead, pick
<br>&gt;&gt; one)
<br>&gt;&gt;
<br>&gt;&gt; did you not get this text? was this, somehow, unclear that you copied
<br>&gt; both
<br>&gt;&gt; virtip-comment and virtio-dev on your patch?
<br>&gt;&gt;
<br>&gt;&gt;
<br>&gt;&gt;&gt; ---
<br>&gt;&gt;&gt; device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
<br>&gt;&gt;&gt; 1 file changed, 24 insertions(+)
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; diff --git a/device-types/balloon/description.tex
<br>&gt; b/device-types/balloon/description.tex
<br>&gt;&gt;&gt; index a1d9603..bc8e109 100644
<br>&gt;&gt;&gt; --- a/device-types/balloon/description.tex
<br>&gt;&gt;&gt; +++ b/device-types/balloon/description.tex
<br>&gt;&gt;&gt; @@ -305,6 +305,12 @@ \subsubsection{Memory
<br>&gt; Statistics}\label{sec:Device Types / Memory Balloon Device
<br>&gt;&gt;&gt; #define VIRTIO_BALLOON_S_CACHES 7
<br>&gt;&gt;&gt; #define VIRTIO_BALLOON_S_HTLB_PGALLOC 8
<br>&gt;&gt;&gt; #define VIRTIO_BALLOON_S_HTLB_PGFAIL 9
<br>&gt;&gt;&gt; +#define VIRTIO_BALLOON_S_OOM_KILL 10
<br>&gt;&gt;&gt; +#define VIRTIO_BALLOON_S_ALLOC_STALL 11
<br>&gt;&gt;&gt; +#define VIRTIO_BALLOON_S_ASYNC_SCAN 12
<br>&gt;&gt;&gt; +#define VIRTIO_BALLOON_S_DIRECT_SCAN 13
<br>&gt;&gt;&gt; +#define VIRTIO_BALLOON_S_ASYNC_RECLAIM 14
<br>&gt;&gt;&gt; +#define VIRTIO_BALLOON_S_DIRECT_RECLAIM 15
<br>&gt;&gt;&gt; le16 tag;
<br>&gt;&gt;&gt; le64 val;
<br>&gt;&gt;&gt; } __attribute__((packed));
<br>&gt;&gt;&gt; @@ -399,6 +405,24 @@ \subsubsection{Memory Statistics
<br>&gt; Tags}\label{sec:Device Types / Memory Balloon D
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb
<br>&gt; page
<br>&gt;&gt;&gt; allocations in the guest.
<br>&gt;&gt;&gt; +
<br>&gt;&gt;&gt; +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The number of Out-Of-Memory
<br>&gt; killer
<br>&gt;&gt;&gt; + invocations.
<br>&gt;&gt;&gt; +
<br>&gt;&gt;&gt; +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The number of stall count
<br>&gt; on memory
<br>&gt;&gt;&gt; + allocation.
<br>&gt;&gt;&gt; +
<br>&gt;&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory that
<br>&gt; has been
<br>&gt;&gt;&gt; + scanned asynchronously (in bytes).
<br>&gt;&gt;&gt; +
<br>&gt;&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory that
<br>&gt; has been
<br>&gt;&gt;&gt; + scanned directly (in bytes).
<br>&gt;&gt;&gt; +
<br>&gt;&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory that
<br>&gt; has been
<br>&gt;&gt;&gt; + reclaimed asynchronously (in bytes).
<br>&gt;&gt;&gt; +
<br>&gt;&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory
<br>&gt; that has been
<br>&gt;&gt;&gt; + reclaimed directly (in bytes).
<br>&gt;&gt;&gt; \end{description}
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory
<br>&gt; Balloon Device / Device Operation / Free Page Hinting}
<br>&gt;&gt;&gt; --
<br>&gt;&gt;&gt; 2.34.1
<br>&gt;&gt;&gt;
<br>&gt;&gt;
<br>&gt; 
<br>&gt; -- 
<br>&gt; zhenwei pi
<br>&gt; 
<br>
<br>-- 
<br>zhenwei pi</p>

--0000000000007a54e6061967326d--
