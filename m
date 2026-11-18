Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996733;
	b=MhLE7hxZ8Dmc9oJ13kicznAC52VHJp28W+wCHcx7vK+QrNjVs733Qr6aM47PyqoXkeDp
	 03RVuiwM4AL1y4vgBYUJ3LeVGKGSr53o2tyWEFFsmWuTrV60hgNUGep505egp5sxrcPKI
	 umsYLgFcB2q0vFhbHtsBa+i2eEmflGOBDDjxmbrns5E1PWf1miNlqMroP3sMqBHDIOkLl
	 m0HMOc8wHZjOYS0ZGsqCWZirOcg1ljGPXk0npRLwFu8Zh7qvFal1t6XsxO5zpEmPLlt8g
	 Zwo6N9ZZLlFsgyb6H3hW4TvBQIiYBTbn0h8U9JoRqy1gWELTbuufx4pUa9MqvxLJeIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=85/2GPPd3pUXc+ixFaifHqkZtwGCrl4YsFFi1NinxRg=;
	b=s0dJ3pK/pBABMY50u5e9bBA1OXNfy7rOap76kErmowuFg0qi108Q+seYaiqcXzocXVnm
	 KX7wajWFsAWk4NQXAtxMCCmm7JYjZwG21pFxk7Jc0OY6dOCAbfzxeuHtmXseojIhPLghW
	 vlDKWEFqjyHnidMeGUHlxqXbRgDhKx94z2a+ZBwP2YByHu3ZxGLMVD47m22CVIEWBAF6T
	 cOAAKpFjMPTW6fRBQmkixlz3ydHjqC6NIn83LyRMh8eX9aLVbvC+IgpSnO2aUfMRwe35q
	 eXpBwpFifL3kL6JeomRwazaKageRcdARBaUMYAQHz5gV26BD5EHWXZ12+iFBLag+VzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fAnUjIjx;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E6606A320
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 10:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536E6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fAnUjIjx
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3704d30b84fso1199312eec.1
        for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794996732; x=1795601532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=85/2GPPd3pUXc+ixFaifHqkZtwGCrl4YsFFi1NinxRg=;
        b=fAnUjIjxFZ445wvdfRZJ48DslkqGrsDi6C5MY80f++f+MEW9YiCkORtGlc5Aol2fma
         i5N/0X90/ka/Haq0vek7k+Z78udH3B90a997Wyk2QGxMXjfJ1hlZYu30u9wAt0scJSwe
         NLSCM/tZ3CtD7BwZmCNxqZveN5hoN5qkGflgAhFPONI4balGuaOJWZ9rJa5edgz8iNeD
         DFu0KQesnhRDk4JX6J0M2H7UHPkTBvlFdP3ZdL0E20sws1UMXA8iN/efkoYn5Pl65yhB
         zlbsrQ81Bli1adiKHTtxcOeFO6RKK6RuF6hLZGXyIDY8n1zNNV2KXcOpy/HiO1Bib3qj
         Oi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996732; x=1795601532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85/2GPPd3pUXc+ixFaifHqkZtwGCrl4YsFFi1NinxRg=;
        b=gb4P1PxrVd9KAofou30nbR355kPyshNOxuE1yqAmXaFPQLBR8wa4qbATqRj9QxvKwk
         QJwrhDtXEg2h4oSEOPk7vQmGo4tdHXRbVOSLQwtqe27gFiaVrejy5FE8OMWfGsSDL3Rq
         gXwmdWQ9QtqTGAZKEDt50ImgfOmFGV+C30t+/ll0J/nLDFhu8q1wMHjG+OZT4FYt1CHz
         PkvlnJhUp8S5NtE9Og5q9p5BsW7ct0/G3ro6EF+DeOOiFUeiAP/ZPi1gPN6lnANJIXxf
         JHZd//ukpwkkWTLvAVEiofhYAuR3vVGTxn6fRMDbk53FJRTCIGrm9OITfITx62iEQFoB
         1TkA==
X-Gm-Message-State: APuU4Z9ePenoLGGxR7xDKTy5ExkiM9ihKdf/HSQtjRXEpsvUQHJC58OM
	QYRrZsJgh5hnAj6AiRQWayMBhnQBdS7ZoWQpQIa5W4EdkdNb6KqhWx4dY1Ntv9iDgJ0=
X-Gm-Gg: AZFdTZeBrof9GinIDCUSUKK7hK1eBJ7F3wy3/jdMeHxYBa6zfBONCsYOBYGGJ0nHeZ5
	V3pLT5C09kLxhe5XP+kIaWieOH2GeClOw2gc+aD/xNjG58reqkfY0nsD49+7Us+p6xLmeMkMu8W
	r9u4UBp73+KZWj5bLHPgzBpptRz+eoB56ZalNGCqSa/Ou8BJnvEZPkU7eQYAC2nhTxsaxpai6V5
	pTs+hG9gT/q/PAqh0JYwRNwySruOCouHyrlW1aEH214HeGss4tmKvo7CHl/JBIbWuOscNTw+lxN
	x/lU2okvnWUDNeVJ7U7mP53/0nMz9sTJrtIX1WOgcdpLScPiHulDCbVj+S4SgYSUgpRgpAayHLT
	ja7105hhjFnRqO6ffXGLwyTdC7x+uGGOdXO2elkCVt3LbFMlfLmIiJcUh6zAFY3EvrjpT1SYdrg
	mVD8Dy6sOSnhkAnXyWAEe1WFqG9+OE+0CfVBCj9ujMjzRRHIKwUHg/Qtt9fTzl+/2DCvwWwAwYr
	voURZ3YWpsMKQrnOhjZnsRBGVCs+KRkh6bfD/F+Zaut1blIPkBDjTHqIzT4sCEI5YorzmiWUzQg
	+XONXJOIgO6VMSXX2NEFiLbVXG0KHA==
X-Received: by 2002:a05:7301:b08:b0:377:e99a:22a5 with SMTP id 5a478bee46e88-38280079524mr1984040eec.6.1794996731674;
        Wed, 18 Nov 2026 02:12:11 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800366sm6396743eec.12.2026.11.18.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:12:10 -0800 (PST)
Date: Wed, 18 Nov 2026 15:42:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>
Subject: Re: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Message-ID: <av15-Mu6L4q3NVWv@vireshk-B250M-D3H>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
 <av1hWL8f-xJWJP5i@vireshk-B250M-D3H>
 <0B2E2334-E360-427B-B7C7-ED67361C7670@arm.com>
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
In-Reply-To: <0B2E2334-E360-427B-B7C7-ED67361C7670@arm.com>

On 18-11-26, 10:06, Bertrand Marquis wrote:
> Hi Viresh,
> 
> Thanks for pointing this out.
> 
> > On 18 Nov 2026, at 09:27, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hi Bertrand,
> >
> > On 15-06-26, 11:10, Bertrand Marquis wrote:
> >> +\busdef{EVENT_DEVICE}
> >> +
> >> +\busref{EVENT_DEVICE} signals device-level hotplug changes as a bus-originated
> >> +control-plane event. The bus instance on the driver side receives these
> >> +indications from the peer bus instance; the table below lists the defined
> >> +device bus states.
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_bus_msg_event_device {
> >> +        le16 device_number;
> >> +        le16 device_bus_state; /* see table below */
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +\begin{tabular}{|l|l|p{7cm}|}
> >> +\hline
> >> +Constant & Value & Meaning \\
> >> +\hline
> >> +DEVICE\_BUS\_STATE\_ADDED    & 0x0001 & Device is present and ready. \\
> >> +DEVICE\_BUS\_STATE\_REMOVED  & 0x0002 & Device is no longer present. \\
> >> +Reserved                    & 0x0003-0x7FFF & Reserved for standard use. \\
> >> +Implementation-defined      & 0x8000-0xFFFF & MAY be used by the bus implementation. \\
> >> +\hline
> >> +\end{tabular}
> >> +
> >> +Upon receiving DEVICE\_BUS\_STATE\_ADDED, drivers typically probe the device
> >> +with \msgref{GET_DEVICE_INFO} before continuing initialization. Upon receiving
> >> +DEVICE\_BUS\_STATE\_REMOVED, drivers typically stop queueing new work, quiesce
> >> +the device instance, tear down local driver state, and release resources.
> >> +Duplicate or out-of-order events can occur and can be handled with additional
> >> +bus-level monitoring, such as \busref{PING}.
> >
> > The Virtio spec doesn't talk about a value of 0 here but the FFA spec
> > says this:
> >
> > The message includes a device change state, which may be one of the
> > following:
> > - Device Ready: A new Virtio Device has been added and is available
> >  for initialization.
> > - Device Not Present: A previously exposed Virtio Device has been
> >  removed.
> > - No Data: The device set has changed, but the device endpoint cannot
> >  identify which Virtio Devices were added or removed.
> >
> > If the state is Device Ready or Device Not Present, the message
> > includes the Device Number of the affected Virtio Device. If the state
> > is No Data, the Device Number is set to 0. In this case, the driver
> > endpoint must re-enumerate the Virtio Device list using
> > BUS_MSG_GET_DEVICES.
> >
> > --------------------
> >
> > Perhaps the virtio-msg requires an update regarding this ? And maybe
> > we need the re-enumeration for other bus implementations too ? Also,
> > we must define what a value of 0 means here.
> 
> Agreed. I'll define state 0 as NO_DATA to indicate that a change has
> occurred, without specifying its nature or identifying individual
> devices. The bus binding would define the required handling.
> 
> During my investigations, killing QEMU removed all the devices it
> provided while the bus implementation remained operational. For FF-A,
> this indication could make the driver-side bus initiate the existing
> bus reset procedure, remove its local devices, and then rediscover and
> initialize the available devices. Other bindings could use a rescan or
> another appropriate procedure.
> 
> The event would retain its existing payload, with device_number set to
> zero and ignored by the receiver. Existing safe-removal and device-number
> reuse requirements would still apply.
> 
> Tell me if you agree with this direction and I will include that in a v3.

LGTM.

-- 
viresh
