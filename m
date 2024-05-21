Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD36125
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 04:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716267432; cv=none; b=jqJ9yHBOjElyiyM0ndUaZutWaNwrMnY5YRBzRQWswuazqmPJx9VGP+RQQqmLxhPtalTP6nJfj6yucy3frqFyMR7J8TuF6N/W3T+lkMmPe6kvZd4IDBklwjShvXCkSSpf3ubYYn4w+4V7TB4M0+g98sXRlvsrQb+rCVpwx77dx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716267432; c=relaxed/simple;
	bh=YcoL3xwBmQIVyA5vmbK8hlUJKjRX/GI4WnBphIwRd5M=;
	h=References:From:In-Reply-To:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxQdbC2daCOvSKjGyVwQTJspohUw/P+qA2LJu+n0QmumL0G52Vm0Az/bYMCbkceVRXAfeq6pOPnS4ok2ltLOHjimyeFbrHWfUKO7jsmnh+xWUitAUZTi2MJCdi8UkPmPlVTbkVKE2YPjy2YHKMD/6l+8+ZH0mlAKYAGBzlmRbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Deh3GvHm; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Deh3GvHm"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de61424f478so3162723276.0
        for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 21:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716267429; x=1716872229; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=bF7N2GYCiKNZBmuQBd3nX5r9kHBo0QgI7MEZ053lQak=;
        b=Deh3GvHmPKVkV7l6yxy0ZFX0h0SrJbCDb29gnTTUpkqinL0c89viEx5ZstYeQ++GTz
         BRa6qxndGQmiklJBvqM42NsAKIAYl4seph+jqvSjqobM+2qfkdqpYYTDdTgB6DEXiklp
         BUeBvJ9IUu71rBGQ0X4vQkNWw2W+563GCjezO7JkGaYjC2+C8VctsQXMgrAYmW0HLGxL
         0eBgA8MKScLrJAeRar96eWgAPhzBzdwGAwiGUV8KqGIN6Wd9Eok3t2plkUQXgt6VpAWz
         ydIC2J0AnID9a6+8w1YqrXsTx9DqYIP3hzeexxTdCr1/GTs/LuZyJ/81DSubBP2ig79w
         WA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716267429; x=1716872229;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF7N2GYCiKNZBmuQBd3nX5r9kHBo0QgI7MEZ053lQak=;
        b=QjoKmHMSvIpAM46D4v/xRvpyHNF7Z70Y0osBtQD8vFno+s1P+ZCRr1T52IUZ2aaL80
         qb8nqejbEHCbGVnuxgksjUAplvShAcbnQFp0ZijmrW07WqcUYkFlgJ20pcLM2+dGdyUm
         6b/0UCaxKXyJhtYaYhSbfUgKo6XCgS9bK7Ar99899U781aigJBVgRl2vDXArWp6R2Hs/
         ixBgBv1ym1ZddqwJuCK05PeH635k67gWaGr+kcT2NH0XfONwuUnASV1a3XMfMYJOzK44
         J/N5SFXtFM5817hpsc23sPxeJsEFHeHp3l1NnzUQtaZvqTvYD/6DbzpDpFGuFWFZUqhY
         bWUw==
X-Gm-Message-State: AOJu0Yx480sfBkkPD57jsR+eFO0H6mzI5fnJzHE5XJPN5HFK7nqL+vt8
	Pkuwoxj+0XM8rEeOFcpkdcO+Ae6cMXqIItiANHPg6ljsXPN1eVXkn7n6PkYX5UWU9QyhJsZZDS0
	OZhHk4ktZEumcW57T7kXdcg46hfXdRnT59/K+kw==
X-Google-Smtp-Source: AGHT+IH4ZZgxZ+pA9xDbhXD9sBw3IUUN0/rj4BcAuJKSSL/xg9OwD0f/nNBuQR0jHXDqeUOgskZZ6KsMGgt7Q6XQqxo=
X-Received: by 2002:a25:aa06:0:b0:df0:5c1c:2d59 with SMTP id
 3f1490d57ef6-df05c1c3928mr19094978276.39.1716267429536; Mon, 20 May 2024
 21:57:09 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 21 May 2024 00:57:09 -0400
X-Original-From: zhenwei pi <pizhenwei@bytedance.com>
References: <20240513121005.459013-1-pizhenwei@bytedance.com>
 <20240513121005.459013-2-pizhenwei@bytedance.com> <20240520234857-mutt-send-email-mst@kernel.org>
User-Agent: Mozilla Thunderbird
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20240520234857-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Tue, 21 May 2024 00:57:09 -0400
Message-ID: <CABoGonKv4sjR93dTuxsbnqxAYA4L3EVohM=wsVxWZfu34P=wMQ@mail.gmail.com>
Subject: Re: Re: [PATCH 1/1] balloon: introduce 6 memory statistics
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, david@redhat.com
Content-Type: multipart/alternative; boundary="0000000000007a49cb0618efa69b"

--0000000000007a49cb0618efa69b
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

Sorry, I received this text, but read that email from my mobile phone
carelessly.

On 5/21/24 11:50, Michael S. Tsirkin wrote:
> On Mon, May 13, 2024 at 08:10:05PM +0800, zhenwei pi wrote:
>> Expose more memory statistics of the virtual memory subsystem from
>> guest, it's helpful to analyze the memory performance and pressure
>> from host side.
>>
>> Signed-off-by: zhenwei pi
>
> zhenwei
>
> when subsriving to the lists you should have received this text:
>
>
> Not to do:
> - copy both virtio-dev and virtio-comment mailing lists (instead, pick
> one)
>
> did you not get this text? was this, somehow, unclear that you copied
both
> virtip-comment and virtio-dev on your patch?
>
>
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
>> +
>> +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The number of Out-Of-Memory
killer
>> + invocations.
>> +
>> +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The number of stall count on
memory
>> + allocation.
>> +
>> +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory that has
been
>> + scanned asynchronously (in bytes).
>> +
>> +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory that has
been
>> + scanned directly (in bytes).
>> +
>> +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory that
has been
>> + reclaimed asynchronously (in bytes).
>> +
>> +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory that
has been
>> + reclaimed directly (in bytes).
>> \end{description}
>>
>> \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory
Balloon Device / Device Operation / Free Page Hinting}
>> --
>> 2.34.1
>>
>

-- 
zhenwei pi

--0000000000007a49cb0618efa69b
Content-Type: text/html; charset="UTF-8"

<p>Hi Michael,
<br>
<br>Sorry, I received this text, but read that email from my mobile phone
<br>carelessly.
<br>
<br>On 5/21/24 11:50, Michael S. Tsirkin wrote:
<br>&gt; On Mon, May 13, 2024 at 08:10:05PM +0800, zhenwei pi wrote:
<br>&gt;&gt; Expose more memory statistics of the virtual memory subsystem from
<br>&gt;&gt; guest, it&#39;s helpful to analyze the memory performance and pressure
<br>&gt;&gt; from host side.
<br>&gt;&gt;
<br>&gt;&gt; Signed-off-by: zhenwei pi 
<br>&gt; 
<br>&gt; zhenwei
<br>&gt; 
<br>&gt; when subsriving to the lists you should have received this text:
<br>&gt; 
<br>&gt; 
<br>&gt; Not to do:
<br>&gt; - copy both virtio-dev and virtio-comment mailing lists (instead, pick
<br>&gt;   one)
<br>&gt; 
<br>&gt; did you not get this text? was this, somehow, unclear that you copied both
<br>&gt; virtip-comment and virtio-dev on your patch?
<br>&gt; 
<br>&gt; 
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
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The number of Out-Of-Memory killer
<br>&gt;&gt; +  invocations.
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The number of stall count on memory
<br>&gt;&gt; +  allocation.
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory that has been
<br>&gt;&gt; +  scanned asynchronously (in bytes).
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory that has been
<br>&gt;&gt; +  scanned directly (in bytes).
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory that has been
<br>&gt;&gt; +  reclaimed asynchronously (in bytes).
<br>&gt;&gt; +
<br>&gt;&gt; +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory that has been
<br>&gt;&gt; +  reclaimed directly (in bytes).
<br>&gt;&gt;  \end{description}
<br>&gt;&gt;  
<br>&gt;&gt;  \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
<br>&gt;&gt; -- 
<br>&gt;&gt; 2.34.1
<br>&gt;&gt;
<br>&gt; 
<br>
<br>-- 
<br>zhenwei pi</p>

--0000000000007a49cb0618efa69b--
