Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4851BF7F8
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794266; cv=none; b=RcAFdiBQAoI5G+g2KPeXf0PtPKL0zwb4WH7RvDWih+1UiDe8pku4mjhZi5xSnGyKBBuxdYdP0dsKfNv3mdRb1hVIse9j8rRtFtfppkPv9xDiU/7L5VWfMujbJ22kn7HSIuH5df4my12Ln9XuTlc+l6pfkvGD0dpQIbrHRqxH2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794266; c=relaxed/simple;
	bh=O/Lc/0pbWT61aUO5TxRmlLIfBORH5znQr7EuIR92SNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FXILEdTbMopyv4oZWrMyp+RjqswWi4x37o7J4pjNOHeo1lrjHnx9pBz/9jGX6t8gHbpOfqs23dEBgF8BV8pkzCpmprwThI5gPSK3s0z7B0eb3z3Cz4fJzlSmBgWkZUkbW7hlLJnKr3EljM6g1E6ItnoHIC33fLjcCR8j+Gf6Rrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3AvpTmQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3AvpTmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727794261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ovE95uOyhVgzch88vUNSIsu1EwMLbS2yabCLFvWH6Hk=;
	b=P3AvpTmQAE4FXRzNl1e2RJ1ML76PuEPHY83zDRHk8g4iVEbWXXsIqDG08Ef6LBIywjtzpT
	l/JuS74L4slzrBNRRJfR4t//yW52402V6LWCybo8vx/tB9hP1rMZtMIf3H9YVc9oHFmWWO
	xMlSDfB0/F5MdFjFNTomE7KCr++c6IM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-pZEHx1jNOLGjC969KpNPfw-1; Tue, 01 Oct 2024 10:51:00 -0400
X-MC-Unique: pZEHx1jNOLGjC969KpNPfw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42caca7215dso32160745e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 01 Oct 2024 07:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794259; x=1728399059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovE95uOyhVgzch88vUNSIsu1EwMLbS2yabCLFvWH6Hk=;
        b=Ey1P2y9QVyDaz0JJ+FJ0XowwKU+NDIKl4YylodLd1s/HMlDpe8+9w1CCyze+1SPzmm
         7XfeB/qcyiPubcaywNHE3XkrvjeLS/U/epbH4bg15ZHHsHn2OkzfqUBtgYDtVMOg4Fzu
         DiBGY8gCL34sy5AxYFKe6UYeyczecZ6txpK3QjKclIfGhll4DnNet4BJWIJkDuC5Nf2z
         8EP6+Nts6P0ipL6BHK6qhY9MmgIHKoevFqlr3df18ZJjrDx8tui5Tf1ywYiRPD6EC0Zd
         XI7tdZ8hAtiMQ2N6eTDBOi7lBhwy6qIvdu7UGGChBgiojfJKQsTY8MUoDCR8dV9Er4Wu
         0zmA==
X-Gm-Message-State: AOJu0YzwXhADljy4GjHLMmaUrFyyZ3IivHoX+PIAT4NBIQVz9UruHOnn
	4610lO8dljUoTOJy9bnO6x5JNch7s6spa0blGuLFDEVusKFaHVRomNqlnUNxA43m0iiUXMOygpr
	U1z2Pdn2f36rfxbnEwYnUrRbToeGHUMcCfcN4AWoBdiEpF++UfsCxx4NOtyDR0OeM
X-Received: by 2002:a05:600c:4451:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-42f58487fc9mr108194495e9.27.1727794258849;
        Tue, 01 Oct 2024 07:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlQa8tHdUA+tcq/brMdJIVNLCEIOrVRevcrWr8zeUQKGrdzCL/O6hAwXlSyrzGtyOC5I7Mog==
X-Received: by 2002:a05:600c:4451:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-42f58487fc9mr108194225e9.27.1727794258202;
        Tue, 01 Oct 2024 07:50:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:55e:42b2:2c3a:bdd9:126e:d43a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e2fe89sm133566915e9.40.2024.10.01.07.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:50:57 -0700 (PDT)
Date: Tue, 1 Oct 2024 10:50:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: virtio-comment@lists.linux.dev,
	Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Petre Eftime <epetre@amazon.de>,
	Leonard Foerster <foersleo@amazon.de>,
	Erdem Meydanli <meydanli@amazon.nl>,
	Eugene Koira <eugkoira@amazon.nl>
Subject: Re: [PATCH RESEND] nsm: Add NSM description
Message-ID: <20241001103502-mutt-send-email-mst@kernel.org>
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


Looks good, thanks!

Yet something to improve:

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

In the title, pls put Nitro Secure Module.
In the text, define NSM:

Nitro Secure Module (NSM) is a device with a very stripped down...


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
> +the device and waits for the device to return the request with a response in

what does with a response mean?

> +the used ring. The request must be inside a buffer of exactly 0x1000 bytes.
> +The reply buffer must be exactly 0x3000 bytes large.

First time you mention reply here. So are there 2 buffers?


> +
> +The driver sends requests with the following format:


in the following format:

> +
> +\begin{lstlisting}
> +struct virtio_nsm_req {
> +        u8 cbor_req[0x1000];
> +};
> +\end{lstlisting}
> +
> +\field{cbor_req} is the CBOR encoded request data. See \url{http://cbor.io/} for information about CBOR.


This is not how we should link to external specs. Add a link to
introduction.tex please, and add a hyperref here.
You also probably want to add a link to the actual RFC.
Readers shouldn't need to dig for it.

> +
> +Possible requests are:

types of requests?

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

what is response descriptor?
Also, you mean response buffer?
Triggers in what sense?


> +
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

These terms do not seem to come from the RFC, at least
a full text search does not turn up anything.
Suggest using terms from the RFC, if at all possible.


> +
> +\subsubsection{DescribePCR}\label{sec:Device Types / NSM Device / Device Operations / DescribePCR}
> +
> +The driver requests a description of the current hash value of a particular
> +PCR value. The device responds with the hash value.

You do not define what a PCR is. That RFC mentions Perl Compatible Regular Expression?
Does not seem logical, so I donnu.
Again, pls decode acronyms on 1st use and link to
where they are explained fully.

I'm not repeating this every time this occurs.


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

again, not clear what is respond.
Maybe something like "respond by writing the following message into the reply buffer"?
I am only guessing.

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

