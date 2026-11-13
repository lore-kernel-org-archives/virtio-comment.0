Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576818;
	b=OzezOHnXrAPJ8zJkR9EWi8BWTBPxeu/ghL3rnn4Imqa64YG3aAcbak0wYkK+UShcjtWd
	 6of4Ox9ku8jC9GkoAsFhTxya1M+vXVRxar1QjeFm3+kPAJrenD651lkdwgyBqRJJyuVQc
	 5sbUJwCMClLXOrZjLMehhuEQSdeySp5P9ztuyqGtgyoOOKTv0hhRdDi5jyRRquVcOWFia
	 w3YFKpWMg8oImqTDkCE9GMPMz6u91/iopIBudtrdDXBsMKX0vaLGo/wMj8GO+SwCqrnl3
	 kNQeBGx59bMBzyzQBUwABvGCU6jUFhhVLDOziiU4kBnLzya4PqdIJg8Q7HAwRiNPDxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576818;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q/2h7J4ZeSI+F0ZPKA2nHP1XIKxo0dVnHuz7Djw2STc=;
	b=mCb2YEZNEPyUhTjY7wTgySy+bIkIA7NN+Dr13W2HT8Lz+S2lTOGMYySSQjDQAFflm45B
	 77BIt3cK8vLnn9WRWHcfp9CbjaRfzcLg6g2BLJhBXcK00eAK2BSds3wVd45Xx+oheLAg8
	 UsBzSZDxmD0L3aZAExnUqkGSBUqRwaObqP/RjzSkxb7RaM6NgEw3EAVykbCVX5FUmhGEK
	 CyW2//X0mn/49wGFQQivnF30B9gub4NsxnFh88LCErsa3/BFyFkjSnbtitbbTaajD4urz
	 84DohTrwhoFiLqmY7ra3aP4n9OT+/thxFOLVTYYI9RwwkA286FIhr+BcYAyCfGEgaJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sv74uI9G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73237606AB8D
	for <virtio-comment@lists.linux.dev>; Fri, 13 Nov 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sv74uI9G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A536E1F000C5;
	Fri, 13 Nov 2026 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576818;
	bh=Q/2h7J4ZeSI+F0ZPKA2nHP1XIKxo0dVnHuz7Djw2STc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Sv74uI9GY4WUo+ExX92xCryOoBS3/npGmZB3qikThqlr6xw5Nq7Vit5r4hLSHX2gf
	 aePFHP5AI3V24MWnWfs27obgPnlRbo3uezMi8nzC+TDPkhIM6iJIZ8VYg1/fAzrjh+
	 yPuKEIRu6Iag7Jkwbmg3S0ysrhLORu8hsuCduwQlf7eBn0etzN5mb/jPU3C2G2M/JE
	 PCNf7XE8PFOLSxkT8IzsCKISZXTD8CQ61U2ho0pk6UA5KPcjBBR8czvccJCxIBY0we
	 YDrshmVe40qk+36dTNYX6YWVWT16XLUmPgYQQTSrrwQYfUjkdhVuMPAWdJvjASHNOY
	 QO/zJHHsfddTQ==
Message-ID: <ef8bfad9-8b56-4e5b-beff-d0111b3b03a6@kernel.org>
Date: Fri, 13 Nov 2026 14:28:32 +0100
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
Subject: Re: [PATCH v2 1/6] virtio-msg: add new command for bus normative
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 virtio-comment@lists.linux.dev
Cc: "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>,
 Bill Mills <bill.mills@linaro.org>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <998059c704fffafbceb9804045b9ffe6cf7a64b2.1781514628.git.bertrand.marquis@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <998059c704fffafbceb9804045b9ffe6cf7a64b2.1781514628.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/26 11:10, Bertrand Marquis wrote:
> Add a new command to have a standard way to define virtio-msg bus
> normative statements.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Bill Mills <bill.mills@linaro.org>
> ---
>  commands.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/commands.tex b/commands.tex
> index 25ea8ee3bc78..122a97f89b10 100644
> --- a/commands.tex
> +++ b/commands.tex
> @@ -7,9 +7,10 @@
>  % How we format a field name
>  \newcommand{\field}[1]{\emph{#1}}
>  
> -% Mark a normative section (driver or device)
> +% Mark a normative section (driver, device, or bus)
>  \newcommand{\drivernormative}[3]{#1{Driver Requirements: #2}\label{drivernormative:#3}}
>  \newcommand{\devicenormative}[3]{#1{Device Requirements: #2}\label{devicenormative:#3}}
> +\newcommand{\busnormative}[3]{#1{Bus Requirements: #2}\label{busnormative:#3}}
>  \newcounter{clausecounter}
>  \newcommand{\conformance}[2]{
>  	\stepcounter{clausecounter}

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
