Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC28288B1
	for <virtio-comment@lists.linux.dev>; Fri,  6 Mar 2026 01:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772760831; cv=pass; b=tyqAteIHnUzWf0L6Pji470/mRSXwJfN7SdW7ID78g5qJtZ9QKLZ4tQt8gzlTK5VMYaf9eKu6vxl4Pc1tnzTYbDrMNUlNc+3g4SHyB7sjfvw+EbDSYgq/CJ6MbyMi1N1hvR6rdqQPhHATNoAJRrJW+da9tPyGcEBHhj9tJpCBGU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772760831; c=relaxed/simple;
	bh=x/iSGxcdIeN0vdhEpXvSWZyVw07SBuFC87JRNgbXiAs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Xs57qVEnsc3wB53r/iNJcPtOKIrjGhHf9IdSZhNtP+ETQDmA+CAY6rcUVqQ7OiUnz4AXjDAET/3gRSeYcA1lGHk1/NFhNrigt5pVDwG+Dd2Uhn3HNgvYSfar/p46w6+F9EfCeK284HLl0jpyPp8Dld7mVSzolOn30SUnDWVAUvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=dsqyDF5B; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="dsqyDF5B"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64acd19e1dfso7486821d50.0
        for <virtio-comment@lists.linux.dev>; Thu, 05 Mar 2026 17:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772760829; cv=none;
        d=google.com; s=arc-20240605;
        b=Bmi/ENvfbt2ITapKA44DU+WgCsWjt/6B4O/Weqai7A2WrxR1GaKpaM9xb/s/Qg+aZG
         WtHchs2HtRr4kuqNEap8lEMmNaUQCVdZg4q5ZtAfw8XNRGH+UQ8HAGo7kLznyhDMbJ8G
         QZu5wmw7uHpLEQWoKu2KZLVUu/XO/YvnUJQOzqT2HEmh2AvqO+87kU1iQp1I0V/YKVmB
         M2ZlUwX5VmRC0/S/EPq7cJzGvTA0o/4R35FaPPrw7KArpWgrwcVcsFzUEqtfeEgusZmw
         dMl9R4NBOjqQ6FYRTjxPDWmC4tiUTsR4tL+tSv5igtGhblEGCOg8C6dNTtZcWivfgtIC
         T21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YCNhHd0WZsDKxZt+TlJ6z4MUd48mIs9wZFWOMSf4wNQ=;
        fh=5CbHP4jIKku4v/dEnP4hPOv/pRuUmt+EAeYFWf0Ihc0=;
        b=A39ih4QXC+sH79XA+5N7vssbdm7VYZvhXyxtisjPgSA3lB3u4pUS6zPNmTRf0qw83c
         TzlHfPmTVqTfRjL73DELvqEHRzHCKA+oGcs+fINIsH4XeiDaBMa+Dac0YfJypDP3aG5z
         SkTORurRf4wpR8Zorwg4utlOPZxYOABsLNVUXIGHt+3+Qrq9HTCGJZLtxz50D+fhXVXv
         4npBf5xexhrGj9/EgvF1aLmfAcx61aavc04375kQ33ie8s8YSkbwdUWb+wOUbNb7NWDI
         pJ+5kqMQXwhx9OZ4rofhRXGpbTdCDW6UeZw7orAXi7L/2ZdIVxTFqHxuriFGUs89ZsKd
         4rtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1772760829; x=1773365629; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YCNhHd0WZsDKxZt+TlJ6z4MUd48mIs9wZFWOMSf4wNQ=;
        b=dsqyDF5BODyN5PuHc6nx0EVt8Cq4d5yt+HLf/txW/go6lhpBQkbnfKOqljCJRdPCAP
         edT8SikjMmpiWLhfFdOnHTlNnWbzaDGElicUntUgnzH0I1U6XiIrUOKBo/o9HlDZeL6L
         7zERemwT+g2NrFcqCmCUWm2OU+aTfoKok0UpHZj6/d50MN3yFmG0IyFQzkOdrEVbg9r3
         P8g6xvoYVZOuqBmN8fkeYnt2ZrxDkAbX+lI5YcMlo4+NshgcDeIoBOwh19TbZvdSzwiC
         Fuis+w4YoY3xcsdhs4Qvuvw88vjw2BO7s5YFqwUQU7hLs1o7fqBCVI/Xbs61rjsVp0p4
         zVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772760829; x=1773365629;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCNhHd0WZsDKxZt+TlJ6z4MUd48mIs9wZFWOMSf4wNQ=;
        b=MlFTEIHXngGtCWxJVrh0D9F4aADhlLGRvKdqHtCBbPotcTqrhi1Mh0FUqLfxrWFGFk
         0Qm8Q0qZONdYSZL+W5j0JtKCC5vsvrxPmKVQVgi4edeP2bm+u4Zubr911B5laDPQb2AM
         O6Nqe6MPgXjMH+vOl1YQ9NvrqJoksyXwEiieRMgYkq3+5DHasE5H8ye+79iFWb8H+eL7
         4cadMM8bD+oIJl4OoDW4YE5+fWXw2Zpnma2/ihL9Icvtbx/fChzt1mS1g4HQKehJafYE
         lsug08g/xXdGgL1KkyVpQDDlmXmqH00zr0LLoFM0sPsLpt0kVODfyMdlO7AzvB//wpdt
         4gqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKjD+I7xBSt1qH2tU4bxQd9j/5GD3YmStRUHuyBMRSPcQIvywT7ChtqiE91eh6xLOWYKS67pJ56caYO8f0BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdohkPinTOzjeFCWXKKHRvZ8I7rkyL3fRhyCcsl0sREoqfCEdM
	C2qu+Vudn3qBX+i4K2Qnx5PgbPhMzUgAO9AbWXNyr4k9Fy6sKBZEG5hFm56WQjrrDf7LIEDYZKu
	HoVsfdP6YUYVkWRhDpj7vTrPtlkMHT61mABAA6cJorA==
X-Gm-Gg: ATEYQzwQt4pEI9BjsMmmepC3Gj/B5ZTCvwtNIGiXn8Q5U1vmX+HOkquMvZqDucb7s7W
	5Xhk2sQu5HsTCA+AcIFStMvSm40lcPNje6/o3EAlVB+lSSXNfFWHCfAuZeVw3FNZdKMExALZNqo
	5ZwC28a6w/xrwoqCIXlcgmxvOxRBO1QwZ64VlPCo49nWgEhkIX65u9c5Ax7Sial7DgEGM8voW+O
	WEVALClVew8hwdzuVdGKyKOKIxWcygk3/4Y7bDtb9e+EI7l3c0oUzV7GFGBNH8vSqDsJDm4j+zR
	wuYe0tL7NoFy2s82vIVHTyROKTWRFmcvE8wAdf1J+FwFGotdnLY=
X-Received: by 2002:a05:690e:1248:b0:649:e294:a380 with SMTP id
 956f58d0204a3-64d141a7997mr554043d50.37.1772760829236; Thu, 05 Mar 2026
 17:33:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Andrei Homescu <ah@immunant.com>
Date: Thu, 5 Mar 2026 17:33:34 -0800
X-Gm-Features: AaiRm53ZhF2IzF3iCW4IqoGnlX9NtDbYJCi7k3Q7ZSFztfEjwgq5ydEKN-mmUnY
Message-ID: <CAGynJTUcVGL9mRVirKo1R8RK1Ftz7fy3HhF2STdXg-FwjPJLSA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
To: bill.mills@linaro.org
Cc: alex.bennee@linaro.org, arnaud.pouliquen@foss.st.com, 
	Bertrand Marquis <bertrand.marquis@arm.com>, edgar.iglesias@amd.com, viresh.kumar@linaro.org, 
	virtio-comment@lists.linux.dev, Armelle Laine <armellel@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Ayrton Munoz <adm@immunant.com>, ayrton@google.com, Andrei Homescu <ahomescu@google.com>
Content-Type: text/plain; charset="UTF-8"

Some minor comments below based on the Trusty implementation of
virtio-msg, and potential future issues for implementers:

> +  \item \textbf{Number of Feature Bits}: Indicates how many bits (organized in
> +    32-bit blocks) the device uses for feature negotiation.
I think v1 required this to be a multiple of 32, and would reject
invalid values (might be misremembering).
IMHO it would be simpler for implementers if this was "number of
feature blocks" instead, like in other places.
Is there a specific reason it is "bits" here?

> +The driver \emph{MAY} issue new \msgref{SET_VQUEUE} for virtqueues that have not
> +yet be setup.  If the VIRTIO_F_RING_RESET feature has been negotiated,
> +individual virtqueues can be reset and then optionally re-configured.
This implies that the device should reject SET_VQUEUE for queues that
have already been setup?
Or could a vqueue be configured multiple times?

> +\msgdef{SET_CONFIG}
> +
> +This message is sent by the virtio-msg transport driver and requires a
> +response from the device.
> +
> +\begin{tabular}{|l|l|l|l|}
> +\hline
> +Type & Offset & Size (bytes) & Content \\
> +\hline \hline
> +Request & 0 & 4 & Configuration generation count \\
> +& 4 & 4 & Configuration offset in bytes \\
> +& 8 & 4 & Number of bytes \\
> +& 12 & ... & Configuration data \\
> +\hline
> +Answer & 0 & 4 & New Configuration generation count \\
Is this a copy of the generation count from the request, or the actual
value from the device?

> +& 4 & 4 & Configuration offset in bytes \\
> +& 8 & 4 &  Number of bytes, or 0 if rejected \\
> +& 12 & ... & Configuration data \\
Is this empty in the "if rejected" case, or a copy of the request data?
My interpretation is "empty", but perhaps this should be specified.

> +\busdef{GET_DEVICES}
> +
> +This message is sent by the virtio-msg driver side bus and requires a response
> +from the device side bus.
> +
> +\begin{tabular}{|l|l|l|l|}
> +\hline
> +Type & Offset & Size (bytes) & Content \\
> +\hline \hline
> +Request & 0 & 2 & Offset \\
> +        & 2 & 2 & Number of device numbers requested \\
> +\hline
> +Answer & 0 & 2 & Offset \\
> +       & 2 & 2 & Number of device numbers in the answer \\
How should a driver handle the case where a misbehaving device sends
back more devices than requested? (in other words, if this value is
greater than the device count in the request)
Or is that not misbehaving?
A driver implementation could ask for e.g. 32 devices at a time and
store the resulting bitmap in a uint32_t.
How should it handle getting back more devices than it has space for?

> +The offset and number of device numbers requested \emph{MUST} be multiples of 8.
> +The next offset \emph{MUST} also be a multiple of 8.
Same question here as for feature bits: why not use bytes (defined as
8 bits, or alternatively octets) instead of bits as the unit for
GET_DEVICES?
Then the device implementation wouldn't need to check for and reject
invalid requests.

Andrei Homescu
