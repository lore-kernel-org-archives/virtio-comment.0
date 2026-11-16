Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846429;
	b=5NnmM6srcgUwcydl+zhsUNjmPCQA5l592nfmjX4wL3eRhOyTnWncySiO9ybn/H2irGCT
	 aFWxFNhVAY8XaQAem/IRglSMxVxwgd0VvQcWnfzQGxzQ7GhkE1MP+8pO3eTwjEIMZXzQV
	 SodsFMrImfdMU97nm8Ar6QfQMLq1lXRauAbAB9NIEdOLulbFImIJSQZWajoE4dd0iIRL9
	 /gKdLIa+CgsYw7UOFtWN8Mx/VoBiz2pamQZBIsVgcvxD4C7jK2VPQzbmH3nzx61YheA7I
	 ozsXKRzsDf8NZBM7DVRMXVw0Q9pkTWpnQc8kvpRWRoh9cGuze78uSeTTEXIaYCNUaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846429;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9uY16jOFN8aueQSNTs3sor21kYkHDr4JYpsZmsQrHgE=;
	b=p7ziaRJoqlxGKLQYVWvA18Y8c8jfGxrwJOw9RafrtJJErXSLxjJ2svAN1Hl8xzUqrZw+
	 OjFovhn0kZGsZjfh5zopRKJOBiZLDsqwcirpmPGQbPBPAAwccbnR9Pjn817uAcUhNyAc5
	 E1Y7Cy5BCbJ30wkLDPIH49rNumVAZliH5pfw10EZC6zrZc7RM7zzVDYeQrwE7euJ1wnmJ
	 ahO1ehR2eCaHNQzEEJ8EFxsMwbQfwcfZKqtuDtgqbMf840QL3jMnIOxL7Kw8Y9snuYfF/
	 ebv1GqLrF2Iiby7lI4nHI2yTjhqdcUHWvg00pNsvk/sT1QgL/iSe8x6StS7z2e+xLew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gckIbx65;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153D606A322
	for <virtio-comment@lists.linux.dev>; Mon, 16 Nov 2026 16:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gckIbx65
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6236F1F000C4;
	Mon, 16 Nov 2026 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846429;
	bh=9uY16jOFN8aueQSNTs3sor21kYkHDr4JYpsZmsQrHgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gckIbx65wnT311Mx2+E9wNO6CbJXJjQZ5x8HJ51LreYUGVm4pMJLxdlsT1OLuRm5C
	 3xKTrRwH28bKeQhmItU8x/2PogAaWvCKRJAJ8yrz7XRhon/oTNiB07NO/40A8472YI
	 lJmqvd5GfJGrsSjt28jpgdy7d32aJxPWeuDgoVEXBXVAta9F7uujX78oS8TOTsnoaj
	 BkXaXEIldPSMoaWWbec1BDqYAOcvIxmiiaw7TQ0Vl4nYfbXdQQaA7YFV9jW46Iy9ha
	 gCebOUnO6EQxnJQdH9LYeMk2Rz2l897avYNnHJ3IAuUBT4xHeaa3VjwUil1IEvrI7z
	 RMZOICe5GKJjg==
Message-ID: <8f7d788f-d835-49e6-91ed-b1d6d3b2b18a@kernel.org>
Date: Mon, 16 Nov 2026 17:27:02 +0100
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>,
 "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
 <b65955a6-d17e-4712-940f-447d068545de@kernel.org>
 <2C9AD15B-D88E-4FDA-9D28-E47B2295B261@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <2C9AD15B-D88E-4FDA-9D28-E47B2295B261@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

>>
>> Not sure if that table really adds a lot of value, hard to tell what else should
>> be mentioned if there is no rev 2 yet. But maybe that's just the common way of
>> doing it.
> 
> I agree that right now it does not add much value. The idea was to have
> a placeholder if a revision 2 is needed to introduce new messages or
> functions.
> 
> I can replace it with a simple sentence defining revision 1 and its
> message-size limits, with the separate 264-byte recommendation.

I guess the table is fine, I was just scratching my head for a second :)

>>
>>> +\end{itemize}
>>> +
>>> +\paragraph{Versioning and Forward Compatibility}
>>> +
>>> +A higher transport revision or additional transport feature bits extend the
>>> +protocol with new messages or capabilities. Implementations are expected to
>>> +remain interoperable across revisions: devices and drivers designed for a newer
>>> +revision still implement the mandatory messages and semantics defined in prior
>>> +revisions.
>>
>> "are expected" -- do we want to make that stricter and turn it into a MUST, or
>> 
>> Is there no "REMOVING" or "Request for removal" request mechanism?
>>
>> Other unplug mechanisms (iirc ACPI) avoid this kind of surprise removal, as it's
>> not particularly nice to handle.
>>
>> I guess for such surprise removal, any concurrent message to the device will
>> silently get lost? Or how is that supposed to work?
> 
> We currently have no pre-removal handshake. REMOVED reports that
> the device is no longer accessible. The intention is to leave
> graceful removal sequencing to the bus binding.
> 
> For requests expecting responses, the existing requirements mandate
> completion with either one protocol response or a transport-visible
> failure under a bounded completion policy. This includes requests
> already outstanding when removal occurs; the bus does not need to
> manufacture a protocol response. One-way events have separate
> delivery rules.
> 
> I'll clarify how these requirements apply during removal and make
> the transport/bus responsibility split more explicit.

Ok, thanks.

> 
>>
>>
>>> +Reserved                    & 0x0003-0x7FFF & Reserved for standard use. \\
>>> +Implementation-defined      & 0x8000-0xFFFF & MAY be used by the bus implementation. \\
>>> +\hline
>>> +\end{tabular}
>>> +
>>> +Upon receiving DEVICE\_BUS\_STATE\_ADDED, drivers typically probe the device
>>> +with \msgref{GET_DEVICE_INFO} before continuing initialization. Upon receiving
>>> +DEVICE\_BUS\_STATE\_REMOVED, drivers typically stop queueing new work, quiesce
>>> +the device instance, tear down local driver state, and release resources.
>>> +Duplicate or out-of-order events can occur and can be handled with additional
>>> +bus-level monitoring, such as \busref{PING}.
>>
>> What if we get a fast sequence of ADDED+REMOVE, REMOVING the device while still
>> probing the driver etc? Isn't that a concern if it's architected like that?
> 
> Yes, removal can race with probing, and the current text does not
> explain the required handling sufficiently.
> 
> I think the bus/transport integration needs to serialize probing
> and teardown, so removal cancels or invalidates an ongoing probe
> and late completions cannot finish binding a removed device.
> 
> We also need clear rules preventing stale requests, responses or
> events from affecting a replacement device using the same number.
> I'll work through those requirements and clarify what each bus
> binding must guarantee.

That would be great.

> 
> The reference to PING here is misleading: it cannot resolve
> reordered lifecycle events or distinguish device lifetimes.
> I'll remove that claim.

Ack.

> 
>>
>>> +
>>> +\busnormative{\paragraph}{EVENT\_DEVICE}{Virtio Transport Options / Virtio Over Messages / Bus Messages / EVENT_DEVICE / Bus}
>>> +\begin{itemize}
>>> +  \item A bus implementation that sends \busref{EVENT_DEVICE} MUST set
>>> +        \field{device\_number} to a valid bus device number exposed to the
>>> +        driver side.
>>> +  \item A bus implementation that sends \busref{EVENT_DEVICE} with
>>> +        DEVICE\_BUS\_STATE\_ADDED MUST do so only when the referenced device is
>>> +        accessible for transport-message processing.
>>
>> Right, but what prevents immediate removal?
> 
> Nothing prevents immediate removal, particularly following a fault.
> ADDED means accessible when announced; it cannot guarantee continued
> presence. We need to specify safe handling of subsequent removal,
> including during probing, as discussed above.
Thanks!

-- 
Cheers,

David
