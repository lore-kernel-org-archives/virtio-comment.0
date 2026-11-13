Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576821;
	b=i6K61zhWNyWfGcGbtz/Fwi2nJmXI+dGmZnu3uGuwz2aFApNGe9K2KX7iC1uj/4u2cpzd
	 lz5MoR+ZlTat/eHVi4w0Ua4Jl9Msa15oZpZBJ35WP5MrnXjN4n0/HJ+V1aJvnzz8XeJ3N
	 lD1d1KAIOUSyNbR69iz20dMK0lrJXQrwB7wQciMLsbydroKCU/CG3tNRWLCxnzq8bfQbw
	 GAM82sh7SrZtGuBAyfo9uF8Nn8H5q/OSdMgZU+6HaLnDg8eRYYkEYnZz/exUXDjw3zwlN
	 kNjU6+M2+dcW3QtGwmHUqNolvHdRgPxEmsZl0CDwuO3JxF24GOTjfsEroOvqRk4VIMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576821;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QrnaVKqCJlheV/ggZFZfinVbbKmoJcO+Mo1DywjzXyo=;
	b=Jns28iow5K47UaYYnsK+20/tyielRMPZiDuZHjP+omrkzTXWVGHVj0Bbml3LUAyyrpgB
	 xdSVZERFu9ODD2uiiHRgxKCUoR7NNN0nF+on9xFCdjt79/TgzZkpkyGkohGBi/7Xj2uMT
	 gUR8YghzeYJb78401BdbD3cQ4eF/kXy1o2PGMA8pQ9Hha5zxmeVBXY8rbktoBJu1vlGEv
	 uVBiytfUnadvagMd60g7+Ts/VSPqskIjxukiOoKDaUfxjhraG0VOZ1q77CTBYu8KmK4ez
	 zbuZBK5zUFq578elA1aCJoLY4ph1OSY1WhEhXqdA8RRMDpcUKqJ/AiQyBV2gN9ccPAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YD+V9KjD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D760606AB88
	for <virtio-comment@lists.linux.dev>; Fri, 13 Nov 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YD+V9KjD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B89F1F000C4;
	Fri, 13 Nov 2026 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576820;
	bh=QrnaVKqCJlheV/ggZFZfinVbbKmoJcO+Mo1DywjzXyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YD+V9KjDFm3HnQkjjvIwuYMoJvuYU1vboYvBWD+S2nLyoi7efeDLFNXtc6NhYmSh1
	 KVI/d6NESgplVGe8KB85dNoc4NWDDxgEiIlwHN5VpSYlCh/vIyqr6TZPTbAmICeyxp
	 XvNkQ+Ika8Tx69uGFWbe1ujqW38rPEI1/P4cejDF/jh7l33JgY8i1+QkFVlhA+sjU9
	 nj5z8n8eU18ogM3o7b1QlT5QjKbeGzGUT4K/ghqK0aOOzEd9/gRqommkcWhRMjjmkP
	 v3ZJTQi9ZnQsrkEHv8zztJBLtGLDet8GzSdZx4FLqg58uETsXv/QtDcsUAuJ9ytoVu
	 TBw84TM8UYNJQ==
Message-ID: <80569817-285e-416e-9bef-041cb1c81f66@kernel.org>
Date: Fri, 13 Nov 2026 14:28:49 +0100
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
Subject: Re: [PATCH v2 2/6] virtio-msg: Add the FF-A bus bibliography
 reference
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 virtio-comment@lists.linux.dev
Cc: "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>,
 Bill Mills <bill.mills@linaro.org>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <d83fbd736249207386be22d1313ccf745592d190.1781514628.git.bertrand.marquis@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <d83fbd736249207386be22d1313ccf745592d190.1781514628.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/26 11:10, Bertrand Marquis wrote:
> Reference the Virtio Message Bus over FF-A specification through the
> normative bibliography using a distinct FFA-BUS citation tag.
> 
> Attribute the DEN0153 document to Arm.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Bill Mills <bill.mills@linaro.org>
> ---
>  introduction.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/introduction.tex b/introduction.tex
> index 9a9cbde5fede..635e267cee04 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -92,6 +92,9 @@ \section{Normative References}\label{sec:Normative References}
>  	\phantomsection\label{intro:I2C}\textbf{[I2C]} &
>  	I2C-bus specification and user manual,
>  	\newline\url{https://www.nxp.com/docs/en/user-guide/UM10204.pdf}\\
> +	\phantomsection\label{intro:FFA-BUS}\textbf{[FFA-BUS]} &
> +	Arm, Virtio Message Bus over FF-A, DEN0153,
> +	\newline\url{https://developer.arm.com/documentation/den0153/0101/}\\
>  	\phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
>  	Arm System Control and Management Interface, DEN0056,
>  	\newline\url{https://developer.arm.com/docs/den0056/c}, version C and any future revisions\\
> @@ -350,4 +353,3 @@ \section{Constant Specifications}\label{sec:Constant Specifications}
>  either VIRTIO_FLD_A or VIRTIO_FLD_B.
>  
>  \newpage
> -

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
