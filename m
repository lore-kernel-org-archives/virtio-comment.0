Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A59628851F
	for <virtio-comment@lists.linux.dev>; Wed,  8 Jul 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525451; cv=pass; b=FaKFqzYr+Vg152TwLYjhM4Z+9xHsMiioE6PLQuoq7D9Sbrt3dc1Q8YaYwFyAeUOzfbr4aK7b+5agUpC5s2V9+orJzThhF0EdL9RbQBhUykBZg8EHtXMuEaqNFhb7AQKIYNWCeLmMLnZnsR6Oy9xY+kbGEHUnEEx4vzeNU0fN9XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525451; c=relaxed/simple;
	bh=mt9nAcuwW9+WLnizslvOIYfZewCZGL5MdCLQM2Kcr7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2EFzsczys0r3jOeEAtd24/GGlgx2teni0USr5EgldJ8i7MiJQlY9mYdsn2owPeZUMED9/P6x+ktjP+FlmJHFv1B2YMa9Z1EDnU93HzuRXRX26+6oI5vuPi9Qv5jMcM1oK0ZJh13aihQt6T2CgGkbvktvQBErTnYic1oeXGvGcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=ijLe/chP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="ijLe/chP"
ARC-Seal: i=1; a=rsa-sha256; t=1783525443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aMA8SHMTJfbrnVqCwKVy7g6uruDXt+h7dE5fY3dW6zy2QuJmiGEESmw/MnLzQ6eWOH1P/rrapeg54tW0wIrlYl8AE/VjGBs8hadwZJwQXYI0AXqMlGZValljENsWWg3QsH38u63kfirHkJyMhI2cIdkH8CBGkURDAkx2osHVbhw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783525443; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LwvAKpUhXjG8M+7dLisvC2lNswzeA9Pmm16wFmiXqYc=; 
	b=MTXMHWBjDwUU9PBBfsgAfXGEqtg+fnfvg9Lr7NitFt/zf2MDUb1LZpfzoM/KM1l4fJkHyOs0oOroUqbfPBBYRLHkonpnS8MHGk7v45uWPomnxWNzt+Tmu4pt6YGlT7kjR+TqoByEyiLwzOCBIrX0C5JdhsOqfNj+rL1xCs+y9/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783525443;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LwvAKpUhXjG8M+7dLisvC2lNswzeA9Pmm16wFmiXqYc=;
	b=ijLe/chPv35nwzXjV1cPAZ5en1avL9jWR4Pw5ah0VN24S64Une5CDH/uknxAaczd
	7xXGfGAl0gPuorOWlfJbLp969jkQD25pq43FgdyvWiXUl21n97xJbMIH+UjA/DQnF+/
	t6RBsSKM1FcPCMAzF420JF3uf/hR6CNKm/BzfN6c=
Received: by mx.zohomail.com with SMTPS id 1783525442033906.0885531555291;
	Wed, 8 Jul 2026 08:44:02 -0700 (PDT)
Message-ID: <45ec0e68-dd5d-4a13-a136-e6cd01df6a26@collabora.com>
Date: Wed, 8 Jul 2026 17:43:57 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 virtio-comment@lists.linux.dev
Cc: "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>,
 Bill Mills <bill.mills@linaro.org>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi all,

Sorry for being late to the party. In January 2026 I received a very
warm welcome in the virtio-msg group meetings, which I subsequently
attended (or at least, I tried to do so). Now, in July 2026, I finally
get around to read the whole thing.

The reason for this may have been that "Things just worked (tm)". Basing
on Viresh's patches for virtio-msg in the Linux kernel and Mani's work
towards virtio-msg over PCIe (including glue code that ties virtio-msg
to the PCIe endpoint controller framework), we were able to build a
virtual GPU out of a off-the-shelf SBC. So no real reason for
intervention, right?!

That said, obviously we would like this to happen, and maybe saying out
loud that this is superb work and a highly valuable contribution to the
ecosystem helps.

On 6/15/26 11:10, Bertrand Marquis wrote:
> Add a new transport layer that is based on messages.
> 
> This transport layer still uses virtqueues as the other transport layers do
> but implements transport layer operations by sending and receiving messages
> instead of the "MMR" reads and writes used in virtio-mmio and virtio-pci.
> 
> This transport is useful when the device and driver are both implemented in
> software but the trap and emulate operations of virtio-mmio and virtio-pci
> can not be used.
> 
> This transport is intended to be used in many situations, including:
> * between a host processor and its co-processors
> * between two different systems (not SMP) connected via PCIe
> * between normal and secure worlds
> * host to vm
> * vm to vm
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Bill Mills <bill.mills@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

This is superb work and a highly valuable contribution to the ecosystem.
Thanks a lot to all people involved in this!

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

One thing, though:

> [...]
> +\subsubsection{Transport Feature Bits}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Transport Feature Bits}
> +
> +Transport feature bits are bus-instance parameters. They are advertised as part
> +of the transport parameters described in
> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions}
> +and are not carried in the device feature blocks exchanged by
> +\msgref{GET_DEVICE_FEATURES} and \msgref{SET_DRIVER_FEATURES}.
> +
> +The following transport feature bits are defined:
> +
> +\begin{tabular}{|l|l|l|p{7cm}|}
> +\hline
> +Bit & Name & Minimum revision & Meaning \\
> +\hline
> +0 & \texttt{VIRTIO\_MSG\_F\_STRICT\_CONFIG\_GENERATION} & 1 &
> +Select strict configuration semantics profile. When this feature is not
> +advertised for the bus instance, the baseline profile applies. See
> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Configuration Semantics Profiles}. \\
> +\hline
> +\end{tabular}

This table overruns the page width in my LaTeX build?!

> [...]

Best regards,
Michael

