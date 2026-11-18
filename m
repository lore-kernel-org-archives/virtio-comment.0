Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990429;
	b=e8rO3paMTR4P6NFqu+4J35tTfVGCOqURV68hXgBq31pBZ2R2byIpP4Bcuc2AlBM9Be4V
	 5thBfUSAEfS5cQs/z7icvesS5Y4J8SpUwqRJof3EG5W1pfWjRm45RTkDHuhMWGaXuErTv
	 7FyvqmLqs3GNXx4dhDKOTPwoAVllw/hAVG7xBnQ1k/YCNzGsDFN/iyNHlfwTV668+JTX+
	 3y7dQSsyAksOOKsovmNdtoZIVHHf4xX8Atv1Hq6Hi+qRX5oCbHjByIs6XL3wmw1tQiQKW
	 Vygp0hUUyOAVB8QhAvieL+WSBwul2L5gqe7Jl4vf9TdohmMH9Gy13GiVeHy95nZdIBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Sq3x++Yah7ku0nbhmVoEM/wGwFfQHnI4H+9jlKDCYgU=;
	b=RSL6lYYnDUdieNG+YdOLHpE7J+Rf9aN1S0UkIz6QzTT4tR2q/ILwNm6vBm0AlPGKbj+r
	 CLXTh3CnZUBUtzlrb8f1trHLgZDhdjj+sqE9+62IheAZbH2m2A7Nwm5tPGKic58oqnEsL
	 9YOO2rq2oHIBcM9GRYk1ZUiWnvdhsGybzNPmXYmsde8PM5uNSXupi1fTathCjgRFiaUz5
	 SsvkTr5v9RGs8nU8at1gJkq94zq4BJF+BWc80qXwykqAlhsvQfeWLuLr4ej72cuXnu3ou
	 EE1WM9Lu7PoWW5Lqvga9ZR5B6eq7Asrw6SpOescikLKd51qaqXG4ZW2Bl+bY7LdWVtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m4jsxRM+;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9B0606A31C
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 08:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m4jsxRM+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-382f4710a17so607732eec.0
        for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 00:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794990428; x=1795595228; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sq3x++Yah7ku0nbhmVoEM/wGwFfQHnI4H+9jlKDCYgU=;
        b=m4jsxRM+YrpJyk1WNtolA/hEMhVse4y4NToCsZ2JhRjr+XRrmZw6asJmq2og3b8oRH
         4HNdpukDyJ9puERLm0M8BE278AmWOmMpSf31az5I0S4FouPaFzY2IbkEnlVXZRtLhr8s
         dYQWgBuj6KjoLrvgVSZNdhMYb9ITpUmLvK8EM6OAUFXofLawfcrng4dg3xB+2lMP3DIT
         DtCU5UHz1a9ifWjefFk66PxrNnofMMVCzbwtEDpnZ69MXt/e3MRAmIS2omjh8vDS//5A
         Ri36KopEKgq6Ftbrq74G+k2l5DS8Lr8v3pEvLlSMQDanIn/4UdH1ISwN1BAeHu+pxia5
         T70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990428; x=1795595228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sq3x++Yah7ku0nbhmVoEM/wGwFfQHnI4H+9jlKDCYgU=;
        b=MTRmphOnXdV0eXJ26mYBMDWQqqJ14709VXr07ZQ+OZxXpxSU1vE2qceRDUmNb21d31
         2vN+1dN3PzIwYzjCamBNFW8LCBk7lc7RffQ6IzCnvNaTqFzx1wi4zSJi/0inWnjJjhpm
         TqHibgTGWhfcsTIvX/46Bvs1JAwHoaHsrSxmaRf5lVZcOed2NfE35AOH9zQsuSoxpVoc
         QPkiYjLyXVZKPGflgqtzDiWGU7bEN11t/fbecZOZjwAtRJYAReVAn25iIBDmyDo2N31v
         yHgytteTHHua8eUp8/D9AH2xbT5bTkC+B9ikV7a0iMaIW+9WnRL9McjRzk8NTmH/s9HP
         6x+Q==
X-Gm-Message-State: APuU4Z/NIoB5fHKBvqig6wvv3LTqZgzCylW8ETpKBuAezmtXXaNSooeq
	fppqW78s+eKUXLdeHnPWFO9W9FNXFfLope/1sL7YudM9YX7YqseOepmvMtiBV/a3yEI=
X-Gm-Gg: AZFdTZdGAx8eVk7jbeuIZ2c/hpaIBiHAkxV2hvhKQ2CYDMWGGuszry4e3CJxqAvx6wp
	A2HRYHTmbhH7DIHPwKzJ3aTXLMju1W0IKZnRBo4XZmzU222HS9y2drzSlHWR7dca++X+DBbntzw
	FzlJJmAbfSzUkkSS7eQ4csO/YyiHD4oTlPDf09z1C9QNwXcWAR0CEJk43vB06PE5fP5nVKoc4SU
	3BJABAZZfmrgYHuRaTlYxYK73ZCFOPSWHdxmIh2cpwF4LAkaXBwHp9PHjvZ2xZDt0PQjpFrZev1
	M0i6wjNncpd30+wSwUNFyXHj67UY0rK26l3w9i93SW0bBLktmtow7ZFKQMZJuSVT1a1Z0Gl++oJ
	pmtPXLAvcg93ThJ/6M6TQ4zXzvMLe/zqI59Pf/swea1t6YhcKQLw083MT1HtjDcKdbfbWHGjfpg
	6rlD5/EENdiDKbNkIEIA9F+4G6lsQ08CZjwwx8RPnjGRRB48r4SqGkJU+yY2gS6oPCI14o37+RL
	T/l7CvPvWJ2WZOs1uCPa24z4ORDSB5KmBHHf7UbSWJnFkDRWkwjR1BsFIj+VlJzXcwJwFyd5ax5
	mLHifeyMDMPRe2KvBwmz5KOjvnkwe64=
X-Received: by 2002:a05:693c:80ce:b0:382:1c33:9d25 with SMTP id 5a478bee46e88-38281bf8f16mr2100184eec.35.1794990428038;
        Wed, 18 Nov 2026 00:27:08 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm5715135eec.11.2026.11.18.00.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:27:07 -0800 (PST)
Date: Wed, 18 Nov 2026 13:57:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: virtio-comment@lists.linux.dev,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: Re: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Message-ID: <av1hWL8f-xJWJP5i@vireshk-B250M-D3H>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>

Hi Bertrand,

On 15-06-26, 11:10, Bertrand Marquis wrote:
> +\busdef{EVENT_DEVICE}
> +
> +\busref{EVENT_DEVICE} signals device-level hotplug changes as a bus-originated
> +control-plane event. The bus instance on the driver side receives these
> +indications from the peer bus instance; the table below lists the defined
> +device bus states.
> +
> +\begin{lstlisting}
> +struct virtio_bus_msg_event_device {
> +        le16 device_number;
> +        le16 device_bus_state; /* see table below */
> +};
> +\end{lstlisting}
> +
> +\begin{tabular}{|l|l|p{7cm}|}
> +\hline
> +Constant & Value & Meaning \\
> +\hline
> +DEVICE\_BUS\_STATE\_ADDED    & 0x0001 & Device is present and ready. \\
> +DEVICE\_BUS\_STATE\_REMOVED  & 0x0002 & Device is no longer present. \\
> +Reserved                    & 0x0003-0x7FFF & Reserved for standard use. \\
> +Implementation-defined      & 0x8000-0xFFFF & MAY be used by the bus implementation. \\
> +\hline
> +\end{tabular}
> +
> +Upon receiving DEVICE\_BUS\_STATE\_ADDED, drivers typically probe the device
> +with \msgref{GET_DEVICE_INFO} before continuing initialization. Upon receiving
> +DEVICE\_BUS\_STATE\_REMOVED, drivers typically stop queueing new work, quiesce
> +the device instance, tear down local driver state, and release resources.
> +Duplicate or out-of-order events can occur and can be handled with additional
> +bus-level monitoring, such as \busref{PING}.

The Virtio spec doesn't talk about a value of 0 here but the FFA spec
says this:

The message includes a device change state, which may be one of the
following:
- Device Ready: A new Virtio Device has been added and is available
  for initialization.
- Device Not Present: A previously exposed Virtio Device has been
  removed.
- No Data: The device set has changed, but the device endpoint cannot
  identify which Virtio Devices were added or removed.

If the state is Device Ready or Device Not Present, the message
includes the Device Number of the affected Virtio Device. If the state
is No Data, the Device Number is set to 0. In this case, the driver
endpoint must re-enumerate the Virtio Device list using
BUS_MSG_GET_DEVICES.

--------------------

Perhaps the virtio-msg requires an update regarding this ? And maybe
we need the re-enumeration for other bus implementations too ? Also,
we must define what a value of 0 means here.

--
viresh
