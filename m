Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193579CD
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735198560; cv=none; b=nX6O/92BA180Hk69o3Mu6ei6q8Y1r5SCvw4st4DjZvTKQvLjH5384jsKj38wiC7N5IK01H1jgfWB4gcHmQy3fwe42N0jOYDvrZ+w3yG+tCE9oFb+y/BigIT/LSidulJXhTwtaCXjfuWhSNvpVOAFYOsR9dnZ+H66kjyZ2MHqAm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735198560; c=relaxed/simple;
	bh=DnCVKmznSPNmW1YB8DHxOihLqes34Xp0R6cWsAuR53E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmpXxr5Jm+VFmEq49y8g4P6n2hYG56hBbbh0L0pnK08yPpea5CE9gr95/Ig0pR1RnDWoq9iXdtioBWd73Fp1keJd7sGpKs5uoRFnQh9I42A4XEVip2SI/WEtHA6e8U2N+Gal4bgbV+wFAoWzreDBsen9BQ4/MvP7/sQopLIhTgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=09P222/Y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="09P222/Y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21683192bf9so75605315ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 23:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735198558; x=1735803358; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KoygFv8bSZ5Rr+hi2jOKV9le3bpri+dC44ZNiv5GWl8=;
        b=09P222/YgmEU7i0Yo7foSytbQ79RV/fJT+fhkFyLERKdKGtQjJ8PusBpdjgxstfiza
         GxsOpnxa1vuCHB889+d8xHt7mFR7FH059t3Epp539hKl2tuqqAReZW61pJaDPT4HrDRx
         AsZhOwkC0lcqChmYwziYF2Bh8sVb8ZNO27KeHnNolUQBhaDXjbxmuMnX8/7E6qxQiUJA
         2n41HjdARHH2U33IRzLxyyUSLaQVuNHm78rZIAuG1JC72APWrrVaz4rOZfb7P6I+Yd9T
         /uheEdNM65wI3f2KluQ1N6RkObbk/jbHf6ZiBTLLvoklJYJvbaDrvdblXuw+hEOlD+BN
         ax8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735198558; x=1735803358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoygFv8bSZ5Rr+hi2jOKV9le3bpri+dC44ZNiv5GWl8=;
        b=XRvwC6YU/OsKPZWp4o2JHTyaUb9UwNZ2gbtDxVnPBA+slBDgx3p6z51MWkzSuH2uxj
         A8iLsfQPieUZozMZSHlDIBeARURdidw58PAlfVXzy8f4Oi+wvtHDEc76yQMH9UF6pC4b
         GbIEqHIL1yV4Oh3C8nhfHPV/pcOaRlwkWsEzkSts2H/5vwrMwLHx5Ty9mTAP0qbudxiW
         1+L4p4jFAu94gEmPbHxt7LSU+myymhsu/tQ2mkkG9woViq1wZpGNCKqpYciTAVPJ+9f+
         btWqAVqno6JAlK3skqndd3TvAmct2rNY25Gxuw6au97D7PxQs8mhDCx/ScxaLBcZiWc4
         ausQ==
X-Gm-Message-State: AOJu0YxOjkuueNwqmRV/OXdkJAInHJySsZzAFpEbe6awezrKdZhLUvh2
	e/SbKbnGZv3Rq+WiWVBV5e1zDn3xROMhvKrM+0lMp5ZJGXCIqGulOlpR+2wBLXo=
X-Gm-Gg: ASbGncvA6WfcnBe2K5VqU8O8dF3ny/Ysji44WBwvn44GYcAmf0u3fT84/5W8eWnAMWF
	cZP39nCWmqdf67/H7s4I+qe0+pb0D4b/XoKjowGwL4lMLa2WddimPXrD6zZMsoxWPmX6a6wTvrR
	MwuDib5UU318ueGHkJt6qbd8KW22Q3hVyvwTZ4tvfX3o6/pJbrAQ925Qc0nxQuY3f4Si+Q16okg
	QeDpmRon9La82V3FyDLYu0q6LGSTr1htvoMRYRIevaaF/7/AlV1TaxymUEFnDp9Aid/UA==
X-Google-Smtp-Source: AGHT+IHGbs7WCd7dblOcptzq6A6Fus1qWHsO4dIzodwMCg4nt6c8bgjrifzRencbrUXQEPamugfIyg==
X-Received: by 2002:a05:6a20:12d5:b0:1e0:d934:6189 with SMTP id adf61e73a8af0-1e5e08012d5mr43340305637.31.1735198558233;
        Wed, 25 Dec 2024 23:35:58 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dd1a8sm12722570b3a.106.2024.12.25.23.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2024 23:35:57 -0800 (PST)
Message-ID: <5fe377c4-c10d-4c4d-8e8f-30420989452d@daynix.com>
Date: Thu, 26 Dec 2024 16:35:55 +0900
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: Ignore num_buffers when unused
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@nvidia.com>, devel@daynix.com
References: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
 <20241226022749-mutt-send-email-mst@kernel.org>
 <20241226023128-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241226023128-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/26 16:32, Michael S. Tsirkin wrote:
> On Thu, Dec 26, 2024 at 02:29:09AM -0500, Michael S. Tsirkin wrote:
>> On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko Odaki wrote:
>>> If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
>>> sets num_buffers to zero while the specification tells to set it to one.
>>>
>>> Let drivers ignore the field to make them compatible with both
>>> vhost_net/QEMU and devices already compliant with the specification.
>>> Also, remove statements requiring devices to set the field to one to
>>> make vhost_net and QEMU compliant.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   device-types/net/description.tex | 26 +++++++++++---------------
>>>   1 file changed, 11 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>> index 76585b0..b82fe8f 100644
>>> --- a/device-types/net/description.tex
>>> +++ b/device-types/net/description.tex
>>> @@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>>>   
>>>   \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>>>   
>>> -The device MUST set \field{num_buffers} to the number of descriptors used to
>>> -hold the incoming packet.
>>> +If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST set
>>> +\field{num_buffers} to the number of descriptors used to hold the incoming
>>> +packet.
>>>   
>>>   The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
>>>   was not negotiated.
>>> -\begin{note}
>>> -{This means that \field{num_buffers} will always be 1
>>> -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
>>> -\end{note}
>>>   
>>>   \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
>>>   \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
>>> @@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>   Processing incoming packets involves:
>>>   
>>>   \begin{enumerate}
>>> -\item \field{num_buffers} indicates how many descriptors
>>> -  this packet is spread over (including this one): this will
>>> -  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
>>> +\item If VIRTIO_NET_F_MRG_RXBUF was negogiated, \field{num_buffers} indicates
>>> +  how many descriptors this packet is spread over (including this one).
>>>     This allows receipt of large packets without having to allocate large
>>>     buffers: a packet that does not fit in a single buffer can flow
>>>     over to the next buffer, and so on. In this case, there will be
>>> @@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>     The other buffers will not begin with a struct virtio_net_hdr.
>>>   
>>>   \item If
>>> -  \field{num_buffers} is one, then the entire packet will be
>>> -  contained within this buffer, immediately following the struct
>>> -  virtio_net_hdr.
>>> +  VIRTIO_NET_F_MRG_RXBUF was not negotiated or \field{num_buffers} is one, then
>>> +  the entire packet will be contained within this buffer, immediately following
>>> +  the struct virtio_net_hdr.
>>>   \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>>>     VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>>>     set: if so, device has validated the packet checksum.
>>> @@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>   \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types / Network Device / Device Operation / Processing of Incoming Packets}
>>>   \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
>>>   
>>> -If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
>>> -\field{num_buffers} to 1.
>>> -
>>>   If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
>>>   \field{num_buffers} to indicate the number of buffers
>>>   the packet (including the header) is spread over.
>>> @@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>   This is due to various bugs in implementations.
>>>   \end{note}
>>>   
>>> +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
>>> +\field{num_buffers}.
>>> +
>>>   If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
>>>   VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>>>   rely on the packet checksum being correct.
>>
>>
>> There could be drivers relying on it.
>> We can add a SHOULD not and ask drivers not to look at it,

The patch adds the following statement:
> If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST
> ignore \field{num_buffers}.

Do you suggest changing MUST to SHOULD or rephrase other words in this 
statement?

>> and we should fix devices.
> 
> Maybe allowing 0 too is a good idea? Need to think through
> implemenation concerns.
> In any case, pls fix devices.

I opted allowing any values for devices based on the discussion in the 
following thread:
https://lore.kernel.org/virtio-comment/CY8PR12MB7195E5A1D321CABBA97D3FD7DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5789536fe7405a7be18e167ff522c27333656fe9

Regards,
Akihiko Odaki
