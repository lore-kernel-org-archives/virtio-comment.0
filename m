Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2F255F53
	for <virtio-comment@lists.linux.dev>; Wed, 10 Sep 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757520088; cv=none; b=dY0BdZegttHBvhEFWT8qnQ8ZNvBpVTVQ+PhisQZlkHsOS+xE67QoLR3bj8HlGUatK/cTtniAYcst3iZGjqle9WAmK3Po6Eod0b4N1KN9LTgPUMcfZ6WACmFLpq95iEl/FOzLNoVmuNTjJh6ExtS6anXKFBgyL1z0m8RIoXovpag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757520088; c=relaxed/simple;
	bh=h0mQKvZax5QhjApM53TQqE7Wo9q6gFOKzKTfgDilres=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJV/8mytgrBmiwPWZacqaQnPZRdsrEp0gee7DnEF37VQFkqUreYDNG4l0ylEBwVt4U9xe52VAoHxZ/AyqHR/i6TTOfhhZnU7hY/FG9MCa3T08NgSWTQCZmAOBcMk8umyPmuZ627FNI8Y299KIXgrjxnkdayMAX0xWQXnyKeY038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqQ56Y4y; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqQ56Y4y"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-723c971b63bso52769656d6.1
        for <virtio-comment@lists.linux.dev>; Wed, 10 Sep 2025 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757520085; x=1758124885; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZoNTMxWp2L7BfzfcFzdsc7cKJ8KsFGISMhknxR0jpI=;
        b=xqQ56Y4yvfhB9RT65nudLWIMk+/3bqxrCv2LwWd6Gw8nmGjHVBO1ztFkHXxNOhZi1j
         nNWZtal0MWECw96yUpUxt1xEe9sDGxON3qZ7lsFfuyIpVMil+Vx9mu2NV1KukQSHYl81
         27KI/3lRLUuGuCBtAWB185QutIDoZTAGeZRzZRWU7wz2t5mdvpSCpXgNpDNF5tJApsFs
         AKADBcKtJIyqPw+YTY42KnFzlWOmXc53Fn6zpiPmHwpzc1rtZgwj6r5QSJuxRPm7Htp7
         b4YYcYrlZSsFYl/J56TvnTeO3lHuhHpap7+M0z/EE0JxeGA1m1Wwiv4tYabfsYMpHc12
         NXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757520085; x=1758124885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZoNTMxWp2L7BfzfcFzdsc7cKJ8KsFGISMhknxR0jpI=;
        b=kQd8sIND4lg3GOlyPdtXiW7PF4K+hMraqTludCMwnr4P+xJEVeM28sZLs8xwkd4VyB
         yX0M/xvUspDitt5rt08UTizo4PE02VxvzY2vXpu+PYiEXqmNqOnfjblbl5rrMEVxTtZ5
         iG6G8T5FVTsPkyuoapitAM0GmkB0yAqWYwt+dz6D8ZZIuYRn9LQ8Oq5mM8EWbS0T7lrp
         RhHElQ/C1vswoxQY6J/dp4ZybCqGGmQ7DXx9pL754MDZ1OomhRvWdI62J/svsbOBF3n6
         oubNylbc0ncdMjFds9l9IGgDoNbWPMEgWQSDtQgyTe6iAfRMQlQkjXOVU4YXHHuS29VT
         O2Cg==
X-Gm-Message-State: AOJu0Yx21SswZb3hyVPLhcaO+yU8k+jReHA+zmKT/7xhIsFqSf4Zvd5n
	tdPkC0DyeXGrpMn26VTBZjgqppXWLHBKXjbfVcUTuOnL6Bzt9nW6p6uqdXws2ckXtCw=
X-Gm-Gg: ASbGncs/qdOen3oe69MQXrvVLrD2sMYYG5b+qkZ/Qv35S6IltFvue8bfS7I/bZDsjKV
	JybX8ZNsi3s/YHhO3rVLXaT+honBPL20WBbhM9l8sUV2eXMj4QKriEDllWzwmchE0SqM+BO5WFx
	IEbXJgM2PeCJS/6Q5m6MdQoHkMIyGtOlGIM8BEcGY1Con/2c9hVl3aZtiUtdOJGzVmBCxCf/5D3
	syweLeAk7ZFhRsOnsNvt/4dm4tuOJ2e5u3XJ1aE5D+l9P+Aky2HRa29N1DC5qxzgjtNRbdItWoX
	+h430DPrwXLYll8x57W9Q7+C8biq9WzM+uM/uz/7L2vPiceM65n665iWQt0K9kGLEMszoxs6HmD
	qbHYW/uZVECw4jUMZzyimg0R+LesUQqRl44o/vOxfqx8NB89F3hcxbgboqY8OkupYtgx6wVw=
X-Google-Smtp-Source: AGHT+IFkt5Ky7+wUdw8kAThykdzUtpiWS93L3I8vKrttayxKrPgsussMsj0v6kj/st/ZSJXVDujA/g==
X-Received: by 2002:ad4:5b8d:0:b0:70f:a42b:1b65 with SMTP id 6a1803df08f44-73943d7d1dfmr180859796d6.66.1757520084452;
        Wed, 10 Sep 2025 09:01:24 -0700 (PDT)
Received: from [192.168.2.7] (pool-108-48-78-67.washdc.fios.verizon.net. [108.48.78.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm129223516d6.59.2025.09.10.09.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 09:01:24 -0700 (PDT)
Message-ID: <21888de4-aedb-4b29-a5de-04e2204f1e2f@linaro.org>
Date: Wed, 10 Sep 2025 12:01:23 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>
References: <20250620224426.3923880-1-bill.mills@linaro.org>
 <20250620224426.3923880-2-bill.mills@linaro.org> <aMF/jhoqcNAYNQo5@fedora>
Content-Language: en-US
From: Bill Mills <bill.mills@linaro.org>
In-Reply-To: <aMF/jhoqcNAYNQo5@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Matias,

On 9/10/25 9:39 AM, Matias Ezequiel Vara Larsen wrote:
> Hello, 
> 
> Thanks for submission. I am still reading this RFC. I left some minor
> comments below though.
> 

I will incorpertate all your editorial comments you made.  Thanks for looking.

I will respond to your questions below ...

> On Fri, Jun 20, 2025 at 06:44:26PM -0400, Bill Mills wrote:
>> Add a new transport layer that is based on messages.
>>
>> This transport layer still uses virtqueues as the other transport layers do
>> but implements transport layer operations by sending and receiving messages
>> instead of the "MMR" reads and writes used in virtio-mmio and virtio-pci.
> 
> I guess virtqueues are still on a region of memory shared between the
> device and the driver and a msgs mechanism is not required to access it. 
> 

Yes, the memory used for virtqueues and for buffers in those virtqueues is
shared between driver and device somehow.

In my OSS NA presentation I disucss various memory models as I think about
them anyway.

See slide 11 here:
https://static.sched.com/hosted_files/ossna2025/a6/Virtio-msg-OSS-NA-2025-v1.1.pdf

[snip]

>> +The fields in this header have the following usage:
>> +\begin{itemize}
>> +  \item \field{type}:
>> +    \begin{itemize}
>> +      \item Bit[0]: Identifies if a message is a request (0) or a response
>> +          to a request (1).
>> +      \item Bit[1]: Identifies if a message is a Transport Message (0) or a
>> +          Bus Message (1).
>> +      \item Bit[2-7] Are reserved for future use and must be zero.
>> +    \end{itemize}
>> +  \item \field{msg_id}:
>> +    Uniquely identifies which message definition applies (e.g., GET_DEVICES,
>> +    GET_DEVICE_FEATURES, SET_CONFIG). The specific range or enumeration of types is
>> +    defined in sections \ref{sec:Virtio Transport Options / Virtio Over Messages / Transport Messages}
>> +    and \ref{sec:Virtio Transport Options / Virtio Over Messages / Bus Messages}.
>> +  \item \field{dev_num}:
>> +     Identifies the Device Number the message is targeting or is coming from for
>> +     Transport Message and must be zero of Bus messages.
> 
> I imagine that the `dev_num` is the mechanism that the bus uses to find
> the correct destination for a msg both when the driver or the device
> sends it, right?.
> 

That is correct.  A bus can have multiple devices and dev_num (a simple
ordinal index) defines which one.  The ordinal space may be sparse.

Thanks again,
Bill
