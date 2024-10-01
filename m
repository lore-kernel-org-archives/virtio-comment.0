Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A765F1C7B98
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727796845; cv=none; b=gSmvWwWPNmiurvZOsG2PKsVNNf8RhN+xHTYpUP++fPiAlY2fxAgZVmxbkwqE5GyTt6AAkMvKVNFXW0mqkPHyWr12Ie1u/wxekEyYH+ox9C7Qg4JwhArOiyh+jsxjJGfFro05bTlE/EcSahFxQMtEuVJqhAlyu5uUsynUYY9mk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727796845; c=relaxed/simple;
	bh=FQB/zaIe0qCqM9ECSL8jV3AhApXSUyy4ST3x+3JTpwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ayjb6yrPt0IT9psN6QBVuEJafPh5GX0OObvK8HsZo9trklPHWwnRdAjiI2VHCxzlyR6h9yjQ5TlQv59dBsOx7gJlOKs395/RxTE2PmgKXYLLKL8uQYlA3xB66A/VumDKiIIxdJgj6DYORDdgHWrVw1YqTRRNYDKqH+EAF8use2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=adiEDP0Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="adiEDP0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727796841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YacMOsqFmmM9n54SJyfz73WJrwVka6kKHV9iJ/IjBaw=;
	b=adiEDP0ZiYHZ7HJ6bcdmV87WtYld0zRq3LcPnjCYdikfUrVX1NM6zjVNZ9HRBKwlLrfR/l
	DtQsRhj/kHzrpITeQ9QT9KYC+yUHPprDD2XgjxXG0rPEBeplO0mnUUMzDma9AWxd+S1Ehk
	OEs8lTDBWCcTwldZxNwsm1a5Tz3jSPM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-DQsuOL9XMnWC5bjOkty9DQ-1; Tue, 01 Oct 2024 11:34:00 -0400
X-MC-Unique: DQsuOL9XMnWC5bjOkty9DQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-45b6057797cso92804141cf.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Oct 2024 08:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727796839; x=1728401639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YacMOsqFmmM9n54SJyfz73WJrwVka6kKHV9iJ/IjBaw=;
        b=th5MZkgy4wnH/qiYToGyPTTIzRndO+4pYIZtN44OC/Zt3oBO451LMLkIb1BLMtdCqW
         u+w83vITSP0d5czTfcGzbq3FgfdcqXzNTeB8vnHolcflZKvg1fn98eoBGcgf5T7+RbL5
         y1Hzy0NdNTi4ooZ2Zmoc6wW5vHKZK42VQ00KcrG9umZpbhDvXwtq8l+KILUIHJcNxBy9
         HUPHOCwzYBvMKQbAFDnTpAOhTA00EK+4LU/MqjVJuIQ7tvokgPTrVEkbnKY+TGuYTA83
         ICVEtcLCepLWqSDcqblH8Tsx0YQxw4fC6zlbQs7bnDEgP7Kf0FGE1j4nR2SyYJZzcRIO
         nT8g==
X-Gm-Message-State: AOJu0Yw8wjnXnSpMX7pn0JzAo4GF67D4EdUfHn+B2P1Oc4VaFmVvGLE+
	7itc+0WEA8qAwTFccNVc3Ze7+X6FznscybeEjrd6XlUIexrBGFwvmThrgH10DMygdq1/x+qXywR
	nzjWxntABhqBqjP0FKgHcVWB0SiKtsSX4lPPWIf5oRLNAQNyqQx9gVvd9c1+Ic/VT
X-Received: by 2002:ac8:7d81:0:b0:455:9ee:fe60 with SMTP id d75a77b69052e-45d80495408mr24271cf.8.1727796839239;
        Tue, 01 Oct 2024 08:33:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6+ljj65QXzeHABMRPqrVICx/FHTMozH2Fsw/HxigaHBdLnoooav78g/tEiQlX+2ecBnXMJQ==
X-Received: by 2002:ac8:7d81:0:b0:455:9ee:fe60 with SMTP id d75a77b69052e-45d80495408mr23841cf.8.1727796838677;
        Tue, 01 Oct 2024 08:33:58 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f19b72asm46948701cf.0.2024.10.01.08.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 08:33:58 -0700 (PDT)
Date: Tue, 1 Oct 2024 17:33:54 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: virtio-comment@lists.linux.dev, "Michael S . Tsirkin" <mst@redhat.com>,
	Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Petre Eftime <epetre@amazon.de>,
	Leonard Foerster <foersleo@amazon.de>,
	Erdem Meydanli <meydanli@amazon.nl>,
	Eugene Koira <eugkoira@amazon.nl>
Subject: Re: [PATCH RESEND] nsm: Add NSM description
Message-ID: <ZvwWYnSd64z2U+zM@fedora>
References: <20241001140926.3015-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241001140926.3015-1-graf@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexander,

You can find some minor comments below.

On Tue, Oct 01, 2024 at 02:09:26PM +0000, Alexander Graf wrote:
> The virtio NitroSecureModule is a device with a very stripped down
> Trusted Platform Module functionality, which is used in the
> context of a Nitro Enclave (see https://lkml.org/lkml/2020/4/21/1020)
> to provide boot time measurement and attestation.
> 
> This patch describes the communication protocol between device and
> driver for the NitroSecureModule virtio device.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>  conformance.tex                         |   2 +
>  content.tex                             |   1 +
>  device-types/nsm/description.tex        | 355 ++++++++++++++++++++++++
>  device-types/nsm/device-conformance.tex |  13 +
>  device-types/nsm/driver-conformance.tex |  13 +
>  5 files changed, 384 insertions(+)
>  create mode 100644 device-types/nsm/description.tex
>  create mode 100644 device-types/nsm/device-conformance.tex
>  create mode 100644 device-types/nsm/driver-conformance.tex
> 
> diff --git a/conformance.tex b/conformance.tex
> index dc00e84..5c7fbb3 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -152,6 +152,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/scmi/driver-conformance.tex}
>  \input{device-types/gpio/driver-conformance.tex}
>  \input{device-types/pmem/driver-conformance.tex}
> +\input{device-types/nsm/driver-conformance.tex}
>  
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>  
> @@ -238,6 +239,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/scmi/device-conformance.tex}
>  \input{device-types/gpio/device-conformance.tex}
>  \input{device-types/pmem/device-conformance.tex}
> +\input{device-types/nsm/device-conformance.tex}
>  
>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
>  A conformant implementation MUST be either transitional or
> diff --git a/content.tex b/content.tex
> index c17ffa6..ba47e7b 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
>  \input{device-types/scmi/description.tex}
>  \input{device-types/gpio/description.tex}
>  \input{device-types/pmem/description.tex}
> +\input{device-types/nsm/description.tex}
>  
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  
> diff --git a/device-types/nsm/description.tex b/device-types/nsm/description.tex
> new file mode 100644
> index 0000000..ff1584e
> --- /dev/null
> +++ b/device-types/nsm/description.tex
> @@ -0,0 +1,355 @@
> +\section{NSM Device}\label{sec:Device Types / NSM Device}
> +
> +The virtio NitroSecureModule is a device with a very stripped down
> +Trusted Platform Module functionality, which is used in the
> +context of a Nitro Enclave (see \url{https://lkml.org/lkml/2020/4/21/1020})
> +to provide boot time measurement and attestation.
> +
> +Since this device provides some critical cryptographic operations,
> +there are a series of operations which are required to have guarantees
> +of atomicity, ordering and consistency: operations fully succeed or fully
> +fail, including when some external events might interfere in the
> +process: live migration, crashes, etc; any failure in the critical
> +section requires termination of the enclave it is attached to, so
> +the device needs to be as resilient as possible, simplicity is
> +strongly desired.
> +

I am not sure if the sentence `so the device needs to be as resilient as
possible, simplicity is strongly desired` adds something and I think it could be
removed but I do not have a strong opinion about it.

> +To account for that, the device and driver are made to have very few
> +error cases in the critical path and the operations themselves can be
> +rolled back and retried if events happen outside the critical
> +area, while processing a request. The driver itself can be made very
> +simple and thus is easily portable.
> +
> +Since the requests can be handled directly in the virtio queue, serving
> +most requests requires no additional buffering or memory allocations
> +on the host side.
> +

What do you mean with `requests can be handled directly in the virtio
queue`? I think I get it after reading the whole patch. You mean that
the device implementation requires only what the guest has exposed as
requests and responses from guest memory and none other memory from the
host is required.

> +\subsection{Device ID}\label{sec:Device Types / NSM Device / Device ID}
> +  33
> +
> +\subsection{Virtqueues}\label{sec:Device Types / NSM Device / Virtqueues}
> +\begin{description}
> +\item[0] nsm.vq.0
> +\end{description}
> +
> +\subsection{Feature bits}\label{sec:Device Types / NSM Device / Feature bits}
> +
> +None.
> +
> +\subsection{Device configuration layout}\label{sec:Device Types / NSM Device / Device configuration layout}
> +
> +None.
> +
> +\subsection{Device Initialization}\label{sec:Device Types / NSM Device / Device Initialization}
> +
> +The driver initializes nsm.vq.0 in preparation for issuing commands and receiving their reponses.
> +
> +\subsection{Device Operations}\label{sec:Device Types / NSM Device / Device Operations}
> +
> +Driver sends a single CBOR encoded request on the request virtqueue, notifies

Maybe it is better to use `request virtqueue` everywhere? However, in
this case, it is easy to understand that is `nsm.vq.0` since there is
only one queue.

> +the device and waits for the device to return the request with a response in
> +the used ring. The request must be inside a buffer of exactly 0x1000 bytes.
> +The reply buffer must be exactly 0x3000 bytes large.
> +
> +The driver sends requests with the following format:
> +
> +\begin{lstlisting}
> +struct virtio_nsm_req {
> +        u8 cbor_req[0x1000];
> +};
> +\end{lstlisting}
> +
> +\field{cbor_req} is the CBOR encoded request data. See \url{http://cbor.io/} for information about CBOR.
> +
> +Possible requests are:
> +
> +\begin{itemize}
> +\item \hyperref[sec:Device Types / NSM Device / Device Operations / DescribePCR]{DescribePCR}
> +\item \hyperref[sec:Device Types / NSM Device / Device Operations / ExtendPCR]{ExtendPCR}
> +\item \hyperref[sec:Device Types / NSM Device / Device Operations / LockPCR]{LockPCR}
> +\item \hyperref[sec:Device Types / NSM Device / Device Operations / LockPCRs]{LockPCRs}
> +\item \hyperref[sec:Device Types / NSM Device / Device Operations / DescribeNSM]{DescribeNSM}
> +\item \hyperref[sec:Device Types / NSM Device / Device Operations / Attestation]{Attestation}
> +\item \hyperref[sec:Device Types / NSM Device / Device Operations / GetRandom]{GetRandom}
> +\end{itemize}
> +
> +Every request always triggers a single reponse in the response descriptor with the following format:
> +

Out of curiosity, why do you need to state that each request always
triggers a single response? Is this in case some implementation decide
to batch several requests and responses in a single chain of
descriptors?

> +\begin{lstlisting}
> +struct virtio_nsm_resp {
> +        u8 cbor_resp[0x3000];
> +};
> +\end{lstlisting}
> +
> +\field{cbor_resp} is the CBOR encoded response data. See \url{http://cbor.io/} for information
> +  about CBOR. It contains either the request specific response or a generic error response:
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("Error"),
> +  value = String(error_name),
> +}
> +\end{lstlisting}
> +
> +where \field{error_name} can be one of
> +\begin{itemize}
> +\item InvalidArgument
> +\item InvalidIndex
> +\item InvalidResponse
> +\item ReadOnlyIndex
> +\item InvalidOperation
> +\item BufferTooSmall
> +\item InputTooLarge
> +\item InternalError
> +\end{itemize}
> +
> +\subsubsection{DescribePCR}\label{sec:Device Types / NSM Device / Device Operations / DescribePCR}
> +
> +The driver requests a description of the current hash value of a particular
> +PCR value. The device responds with the hash value.
> +
> +\drivernormative{\paragraph}{DescribePCR}{Device Types / NSM Device / Device Operations / DescribePCR}
> +
> +\begin{lstlisting}
> +Map(1) {
> +  ring("DescribePCR"),
> +  value = Map(1) {
> +    key = String("index"),
> +    value = Int(pcr)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{pcr} The PCR index to return the current hash value for.
> +
> +\devicenormative{\paragraph}{DescribePCR}{Device Types / NSM Device / Device Operations / DescribePCR}
> +
> +The device MUST respond with an error message or with the following success message:
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("DescribePCR"),
> +  value = Map(2) {
> +    key = String("data"),
> +    value = Array(),
> +    key = String("lock"),
> +    value = Bool()
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{data} The hash value of the selected PCR
> +\field{lock} True if the PCR value is locked and thus immutable, False otherwise
> +
> +\subsubsection{ExtendPCR}\label{sec:Device Types / NSM Device / Device Operations / ExtendPCR}
> +
> +The driver requests to add binary data to a PCR value which the device then
> +appends to the PCR hash value. The device responds with the new PCR value.
> +

Do you mean that this command allows the driver to request to add binary
data to a PCR value, then, if command succeeds, the device appends the
binary data to the PCR hash value and responds with the new PCR value?
Does the device respond with the appended data?

> +\drivernormative{\paragraph}{ExtendPCR}{Device Types / NSM Device / Device Operations / ExtendPCR}
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("ExtendPCR"),
> +  value = Map(2) {
> +    key = String("index"),
> +    value = Int(pcr),
> +    key = String("data"),
> +    value = Array(data)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{pcr} The PCR index to return the current hash value for.
> +\field{data} The binary data to cryptographically append to the PCR value
> +
> +\devicenormative{\paragraph}{ExtendPCR}{Device Types / NSM Device / Device Operations / ExtendPCR}
> +
> +The device MUST respond with an error message or with the following success message:
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("ExtendPCR"),
> +  value = Map(1) {
> +    key = String("data"),
> +    value = Array(data)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{data} The new hash value of the selected PCR
> +
> +\subsubsection{LockPCR}\label{sec:Device Types / NSM Device / Device Operations / LockPCR}
> +
> +The driver requests to set a PCR to locked state. A PCR in locked state becomes
> +immutable for the lifetime of the enclave. The device reponds with an error or
> +success message.
> +
> +\drivernormative{\paragraph}{LockPCR}{Device Types / NSM Device / Device Operations / LockPCR}
> +
> +The driver requests to lock the PCR using the following message:
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("LockPCR"),
> +  value = Map(1) {
> +    key = String("index"),
> +    value = Int(pcr)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{pcr} The PCR index to lock
> +
> +\devicenormative{\paragraph}{LockPCR}{Device Types / NSM Device / Device Operations / LockPCR}
> +
> +The device MUST respond with an error message or with the following success message:
> +
> +\begin{lstlisting}
> +String("LockPCR")
> +\end{lstlisting}
> +
> +\subsubsection{LockPCRs}\label{sec:Device Types / NSM Device / Device Operations / LockPCRs}
> +
> +The driver requests to set multiple PCR to locked state. A PCR in locked state becomes
> +immutable for the lifetime of the enclave. The device reponds with an error or
> +success message.
> +
> +\drivernormative{\paragraph}{LockPCRs}{Device Types / NSM Device / Device Operations / LockPCRs}
> +
> +The driver requests to lock multiple PCRs using the following message:
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("LockPCRs"),
> +  value = Map(1) {
> +    key = String("range"),
> +    value = Int(pcr)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{pcr} The highest index to lock. All PCR indext from 0 to this number will get locked.
> +
> +\devicenormative{\paragraph}{LockPCRs}{Device Types / NSM Device / Device Operations / LockPCRs}
> +
> +The device MUST respond with an error message or with the following success message:
> +
> +\begin{lstlisting}
> +String("LockPCRs")
> +\end{lstlisting}
> +
> +\subsubsection{DescribeNSM}\label{sec:Device Types / NSM Device / Device Operations / DescribeNSM}
> +
> +The driver requests to receive information about the NSM device and its current
> +configuration. The device responds with an error or the data.
> +
> +\drivernormative{\paragraph}{DescribeNSM}{Device Types / NSM Device / Device Operations / DescribeNSM}
> +
> +The driver requests to receive information about the NSM device using the following message:
> +\begin{lstlisting}
> +String("DescribeNSM"),
> +\end{lstlisting}
> +
> +\devicenormative{\paragraph}{DescribeNSM}{Device Types / NSM Device / Device Operations / DescribeNSM}
> +
> +The device MUST respond with an error message or with the following success message:
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("DescribeNSM"),
> +  value = Map(7) {
> +    key = String("digest"),
> +    value = String(digest),
> +    key = String("max_pcrs"),
> +    value = Int(max_pcrs),
> +    key = String("module_id"),
> +    value = String(module_id),
> +    key = String("locked_pcrs"),
> +    value = Array<u16>(locked_pcrs)
> +    key = String("version_major"),
> +    value = Int(major),
> +    key = String("version_minor"),
> +    value = Int(minor),
> +    key = String("version_patch"),
> +    value = Int(patch)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{digest} The digest NSM uses to calculate PCR hash values. Can be "SHA256", "SHA384" or "SHA512".
> +\field{max_pcrs} The maximum number of PCRs that NSM supports. Typically 32.
> +\field{module_id} The enclave identifier (e.g. i-1234-enc-5678)
> +\field{locked_pcrs} Array of all PCRs that are in locked state
> +\field{major} Major version of NSM (X in X.Y.Z)
> +\field{minor} Minor version of NSM (Y in X.Y.Z)
> +\field{patch} Patch version of NSM (Z in X.Y.Z)
> +
> +\subsubsection{Attestation}\label{sec:Device Types / NSM Device / Device Operations / Attestation}
> +
> +The driver requests an attestation document that contains the cryptographically
> +signed state of the system. The device responds with an error or the document.
> +
> +\drivernormative{\paragraph}{Attestation}{Device Types / NSM Device / Device Operations / Attestation}
> +
> +The driver requests to receive an attestation document using the following message:
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("Attestation"),
> +  value = Map(3) {
> +    key = String("user_data"),
> +    value = Array(),
> +    key = String("nonce"),
> +    value = Array(),
> +    key = String("public_key"),
> +    value = Array(),
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{user_data} Free form data that will be included in the signed document verbatim
> +\field{nonce} A nonce value that will be included in the signed document
> +\field{public_key} A public key value that will be included in the signed document
> +
> +\devicenormative{\paragraph}{Attestation}{Device Types / NSM Device / Device Operations / Attestation}
> +
> +The device MUST respond with an error message or with the following success message:
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("Attestation"),
> +  value = Map(1) {
> +    key = String("document"),
> +    value = Array(document)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{document} The NSM provided attestation document
> +
> +\subsubsection{GetRandom}\label{sec:Device Types / NSM Device / Device Operations / GetRandom}
> +
> +The driver requests random data from the NSM device. The device responds with
> +an error or success message.
> +
> +\drivernormative{\paragraph}{GetRandom}{Device Types / NSM Device / Device Operations / GetRandom}
> +
> +The driver requests random data using the following message:
> +\begin{lstlisting}
> +String("GetRandom")
> +\end{lstlisting}
> +
> +\devicenormative{\paragraph}{GetRandom}{Device Types / NSM Device / Device Operations / GetRandom}
> +
> +The device MUST respond with an error message or with the following success message:
> +
> +\begin{lstlisting}
> +Map(1) {
> +  key = String("GetRandom"),
> +  value = Map(1) {
> +    key = String("random"),
> +    value = Array(random)
> +  }
> +}
> +\end{lstlisting}
> +
> +\field{random} Random data
> \ No newline at end of file
> diff --git a/device-types/nsm/device-conformance.tex b/device-types/nsm/device-conformance.tex
> new file mode 100644
> index 0000000..9f752d6
> --- /dev/null
> +++ b/device-types/nsm/device-conformance.tex
> @@ -0,0 +1,13 @@
> +\conformance{\subsection}{NSM Device Conformance}\label{sec:Conformance / Device Conformance / NSM Device Conformance}
> +
> +An NSM device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{devicenormative:Device Types / NSM Device / Device Operations / DescribePCR}
> +\item \ref{devicenormative:Device Types / NSM Device / Device Operations / ExtendPCR}
> +\item \ref{devicenormative:Device Types / NSM Device / Device Operations / LockPCR}
> +\item \ref{devicenormative:Device Types / NSM Device / Device Operations / LockPCRs}
> +\item \ref{devicenormative:Device Types / NSM Device / Device Operations / DescribeNSM}
> +\item \ref{devicenormative:Device Types / NSM Device / Device Operations / Attestation}
> +\item \ref{devicenormative:Device Types / NSM Device / Device Operations / GetRandom}
> +\end{itemize}
> \ No newline at end of file
> diff --git a/device-types/nsm/driver-conformance.tex b/device-types/nsm/driver-conformance.tex
> new file mode 100644
> index 0000000..437b0c7
> --- /dev/null
> +++ b/device-types/nsm/driver-conformance.tex
> @@ -0,0 +1,13 @@
> +\conformance{\subsection}{NSM Driver Conformance}\label{sec:Conformance / Driver Conformance / NSM Driver Conformance}
> +
> +An NSM driver MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Device Types / NSM Device / Device Operations / DescribePCR}
> +\item \ref{drivernormative:Device Types / NSM Device / Device Operations / ExtendPCR}
> +\item \ref{drivernormative:Device Types / NSM Device / Device Operations / LockPCR}
> +\item \ref{drivernormative:Device Types / NSM Device / Device Operations / LockPCRs}
> +\item \ref{drivernormative:Device Types / NSM Device / Device Operations / DescribeNSM}
> +\item \ref{drivernormative:Device Types / NSM Device / Device Operations / Attestation}
> +\item \ref{drivernormative:Device Types / NSM Device / Device Operations / GetRandom}
> +\end{itemize}
> -- 
> 2.40.1
> 
> 
> 
> 
> Amazon Web Services Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597
> 
> 

