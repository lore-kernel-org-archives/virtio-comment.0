Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426027466A
	for <virtio-comment@lists.linux.dev>; Fri, 13 Feb 2026 19:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771009777; cv=none; b=ZCYB4HtfBvIZdo4Zsg45YCAg2Dfn3y+chiOrHz8BXa5bm8qaQS6y+lp930y+JeBJhG36XUl9q0UXwgqZ6qhi2r+EcWpyFH+HmUjq3295Uj8zOJtqGCwplUkcuNBfOjboKxSx7tWCWK97vhpbUq+Ed40svV9GzJAzHuX3q+DxbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771009777; c=relaxed/simple;
	bh=HNoSeefzu6uDPVSH56aj3/wLFDqL065EYhSR0xf4D5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqSfLV503s9nGDuV9NeZk5asYguPvg73P+n0i1Zt6ROtgNnVDaewUFDK0mvmKjXch/lqOzNtfdABd9T6BCoMiXSGv7ET4/PXNeOu8OEMFaBtX20Uo4ltusUR6vF7ceUpXzW3980dxbnv91R5m3Pxa+cfHHsEZ7GpAqcYnIAs408=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE40AqB2; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE40AqB2"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ae5f0777dso1318645d50.3
        for <virtio-comment@lists.linux.dev>; Fri, 13 Feb 2026 11:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771009775; x=1771614575; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qa8hTAfbKJKjVIGh4gB6AMQ29JSS1/+jUGdYkpMJk/M=;
        b=EE40AqB2ZFS/o+C28iter7M6rvoiFgsnJHatnV1f1ysB7VncudAumwTNIUooVwWGxw
         44jOQSjkCD8U81a6QIFd3XB/XHT5IDu+u6KkA2b9vKROH3+tgRGfcH9RIzn1iEe+zppr
         PE81QHze23cq6MJ/fUCCvxe302KZ8w02yBAAzyUUpoT4dMDD8dGkeLggyK0O/pYZQsGd
         J1F+XJSl8S9rwI58v2dcNIxdRBke3pl7il3QZLzFstcNks9nA/IrdM2iWCQiQPoI88wM
         zuI4oO2dxUbDAviTB/tSV+XxO9Xm+4EdNBAHxjJVa3K/m0Q61UzKMztSwuBowriQDGer
         cSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771009775; x=1771614575;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qa8hTAfbKJKjVIGh4gB6AMQ29JSS1/+jUGdYkpMJk/M=;
        b=JL38y/uvosMXBh4Y50q8N3KSIw341fdxLK8SVnvu+NYN44pG5aVmWD12474uKaRrPd
         hwuLYQJDlSJIaUKQWkk54mbwDeRztdMljXcMZqEN8Vv3bNfKp6E449kF71MB9FJxYX2j
         T1g1Gu9VU0EcfLC39lWxWPab7q2Q/wmzgjqVNyDczpqw4s+vhu9dXWpJSrFxFMIa+Thf
         u4X6Oqb3safT6iKmS6Kx1EU8LCniQZ1w4zhejElrR6fm9XzY3Xn3qemfr/ZgqmN3eT4a
         W4bRl5fvsblRe+cuiV9dRfylshB0l706YrcXLDD2R7qYwLbeiqgOBowG2Jzd+q7LQ9Dm
         dR1w==
X-Forwarded-Encrypted: i=1; AJvYcCWMwxonibmc7bOg82QTI9eTAVr/4Ud01OBmyE7BA3maFkuohx2LgpJjwu8ayxCSaI00fi4QQECTHgde+H10nw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6JTLwY19FbRmIhZCDLLQfVzZAhxutt07lQqRWRVWCZJM/52eg
	aUVCU+9TBOKg0WVDUwuNnS6kr7ljkUWVZa71xseVFUj8oVBq9JFYtTeM
X-Gm-Gg: AZuq6aIoZ/Tjq5pUwrWsqggmNUuwSQ87k/Ew1idghlOH/dDXhkM2UP/NPrYZeocD3wG
	V0pfGcCkW3i+zEQb+CAkmd0nUJuhUu0uD/XofqD+xykj7DaxBZTDZBGF1m4Zm2Y4wkmYm02f9i4
	pQ5TfuSE6flD+CBcQ1vBIpW6zsn1RT1Mri2HztfUQnQBdv0LMIHfs/4iONGfTcxwKSibs/FRc4z
	rg7pk4BKlpvVflYQOSbSBgoKeqfOYl6tCY9QHvWYwCEHvxTm++32fPD3Be9dSXG6B0kzH5JKwhz
	BkGzRPglkH9HRHgMEw6/aGLCc/J3a3v9FbsdcbH7RPEmysXTAwQoC2g5zS/qKrDHP/6wHwnYAwP
	byyVYs1q9qp1i/+6iE8Rgy/s7iCTPmJ+vaph6NxhGO79QdaFIQv8Z93b4JNPL7TImnPoLDN4KKx
	fqt7VKYA1x6TAtd4mVH1hBc/HxcJXsCG4DxsjbW0kFNgNcz8qcUGI8oQbpoESKQGMgHwY2Z2KEx
	54Pr2BG7G2AQsrVA/19+FfV0F8SMtqnr4+ddcMRBA==
X-Received: by 2002:a05:690c:4b09:b0:797:abd5:a2ee with SMTP id 00721157ae682-797abd5c228mr12492777b3.11.1771009774416;
        Fri, 13 Feb 2026 11:09:34 -0800 (PST)
Received: from [10.138.34.110] (h69-131-216-128.cncrtn.broadband.dynamic.tds.net. [69.131.216.128])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c1a398asm72450537b3.22.2026.02.13.11.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 11:09:33 -0800 (PST)
Message-ID: <6b4a7cfe-15bc-45cf-9fdf-ae99aafbfc15@gmail.com>
Date: Fri, 13 Feb 2026 14:09:16 -0500
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260126163230.1122685-3-bill.mills@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aLWdFyyhvSZi1WQoIIx8x8pT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aLWdFyyhvSZi1WQoIIx8x8pT
Content-Type: multipart/mixed; boundary="------------dCJ0rZ8UoF4DmijJ001MsSc5";
 protected-headers="v1"
Message-ID: <6b4a7cfe-15bc-45cf-9fdf-ae99aafbfc15@gmail.com>
Date: Fri, 13 Feb 2026 14:09:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260126163230.1122685-3-bill.mills@linaro.org>

--------------dCJ0rZ8UoF4DmijJ001MsSc5
Content-Type: multipart/mixed; boundary="------------AAsZ3ntKi0V0VYX0VOSnDRKs"

--------------AAsZ3ntKi0V0VYX0VOSnDRKs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1/26/26 11:32, Bill Mills wrote:
> Add a new transport layer that is based on messages.
>=20
> This transport layer still uses virtqueues as the other transport layer=
s do
> but implements transport layer operations by sending and receiving mess=
ages
> instead of the "MMR" reads and writes used in virtio-mmio and virtio-pc=
i.
>=20
> This transport is useful when the device and driver are both implemente=
d in
> software but the trap and emulate operations of virtio-mmio and virtio-=
pci
> can not be used.

(snip)

> +\subsubsection{Message Ordering}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Con=
cepts / Ordering}
> +
> +Transport messages fall into two classes: requests (which expect respo=
nses) and
> +events (which are one-way). Drivers and devices rely on the bus to pre=
serve the
> +relative ordering of request/response pairs for each device number; th=
ey do not
> +interpret the \field{token} field directly.

I expect that this requires all messages for a given device to be
processed sequentially, which is not going to be fast.  At the very
least, messages on different virtqueues should be able to be processed
out of order.

I would have some sort of stream identifier that is made visible to
the bus layer.  This would map to a QUIC stream, a single ring buffer,
or something else that ensures in-order delivery.  Messages with
different stream identifiers may be processed out of order.

> +\busnormative{\paragraph}{Message Ordering}{Virtio Transport Options /=
 Virtio Over Messages / Basic Concepts / Ordering / Bus}
> +\begin{itemize}
> +  \item For each device number, a bus implementation MUST deliver resp=
onses to
> +        the driver in the same order that it forwarded the correspondi=
ng
> +        requests to the device.
> +  \item A bus implementation MUST ensure that every request forwarded =
to a
> +        device results in exactly one response delivered to the driver=
 (unless
> +        the request is defined as an event).
> +\end{itemize}
What is the reason for the device/driver distinction here?
Intuitively, I expect both requests and responses to just be messages
at the bus layer.

(snip)

> +\devicenormative{\paragraph}{Feature Negotiation}{Virtio Transport Opt=
ions / Virtio Over Messages / Device Initialization / Device Features / D=
evice}
> +\begin{itemize}
> +  \item When handling \msgref{GET_DEVICE_FEATURES}, a device MUST retu=
rn zero
> +        for any requested bits that fall outside the number of feature=
 bits it
> +        implements.
> +  \item After receiving \msgref{SET_DRIVER_FEATURES}, a device MUST up=
date its
> +        internal feature mask to match the acknowledged set and MUST r=
eflect
> +        acceptance or rejection by leaving the FEATURES\_OK bit set or=
 clearing
> +        it in the status returned by \msgref{SET_DEVICE_STATUS}.
> +\end{itemize}

What should the device do if it doesn't support the feature?

> +\subsubsection{Device Configuration}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device In=
itialization / Device Configuration}
> +
> +Drivers use \msgref{GET_CONFIG} to read portions of the configuration =
space by
> +supplying an offset and length; the device returns the requested data =
plus the
> +current configuration generation count. Writing is performed via
> +\msgref{SET_CONFIG}, which carries the same offset/length along with t=
he
> +driver's notion of the generation count and the new data.

I think this should come with a (non-normative) note that the use of
configuration space is discouraged if the data can instead be sent
over a virtqueue.  For MMIO and PCI transports, the configuration
space is slightly more convenient as it is accessed synchronously,
but for the message transport, reads are also asynchronous unless
the driver spins or sleeps until getting a reply.

> +\drivernormative{\paragraph}{Device Configuration}{Virtio Transport Op=
tions / Virtio Over Messages / Device Initialization / Device Configurati=
on / Driver}
> +\begin{itemize}
> +  \item A driver MUST ensure that the offset and length in each
> +        \msgref{GET_CONFIG} or \msgref{SET_CONFIG} request stay within=
 the
> +        configuration size reported by \msgref{GET_DEVICE_INFO}.
> +  \item A driver MUST include its most recently observed configuration=

> +        generation count in a \msgref{SET_CONFIG} request and SHOULD r=
e-read the
> +        configuration (via \msgref{GET_CONFIG}) if the request is reje=
cted for a
> +        generation mismatch.
> +\end{itemize}
> +
> +\devicenormative{\paragraph}{Device Configuration}{Virtio Transport Op=
tions / Virtio Over Messages / Device Initialization / Device Configurati=
on / Device}
> +\begin{itemize}
> +  \item A device MUST reject a \msgref{SET_CONFIG} request whose gener=
ation
> +        count does not match its current value and MUST indicate the r=
ejection
> +        in the response.
> +  \item A device MUST return the current configuration generation coun=
t
> +        alongside any data returned via \msgref{GET_CONFIG}.
> +\end{itemize}
> +
> +\subsubsection{Virtqueue Configuration}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device In=
itialization / Virtqueue Configuration}
> +
> +Drivers query virtqueue parameters with \msgref{GET_VQUEUE}, configure=
 them via
> +\msgref{SET_VQUEUE}, and optionally reset them using \msgref{RESET_VQU=
EUE} (if
> +VIRTIO\_F\_RING\_RESET is negotiated). Each queue is typically configu=
red by
> +reading its maximum size, provisioning descriptor/available/used buffe=
rs, and
> +then calling \msgref{SET_VQUEUE} with the chosen size and guest-physic=
al
> +addresses.
> +
> +\drivernormative{\paragraph}{Virtqueue Configuration}{Virtio Transport=
 Options / Virtio Over Messages / Device Initialization / Virtqueue Confi=
guration / Driver}
> +\begin{itemize}
> +  \item A driver MUST use \msgref{GET_VQUEUE} to determine the maximum=
 queue
> +        size and confirm that a queue is inactive before programming i=
t.
> +  \item A driver MUST ensure the queue size provided in \msgref{SET_VQ=
UEUE} does
> +        not exceed the maximum reported by the device and MUST supply =
valid
> +        descriptor/driver/device addresses before enabling the queue.
> +  \item If VIRTIO\_F\_RING\_RESET has been negotiated and a queue requ=
ires
> +        reinitialization, the driver SHOULD use \msgref{RESET_VQUEUE} =
before
> +        reprogramming it.
> +\end{itemize}

Why SHOULD and not MUST?

> +\devicenormative{\paragraph}{Virtqueue Configuration}{Virtio Transport=
 Options / Virtio Over Messages / Device Initialization / Virtqueue Confi=
guration / Device}
> +\begin{itemize}
> +  \item A device MUST report accurate maximum queue sizes in \msgref{G=
ET_VQUEUE}
> +        and MUST persist the parameters supplied via \msgref{SET_VQUEU=
E} (size,
> +        descriptor, driver, and device addresses).
> +  \item When \msgref{RESET_VQUEUE} is issued (and VIRTIO\_F\_RING\_RES=
ET is
> +        negotiated), the device MUST quiesce the queue, release any re=
sources
> +        associated with it, and allow the driver to reconfigure it.
> +\end{itemize}

What should a device do if it gets a request that a driver is
forbidden from making?  Untested corner-cases tend to be a good
source of security vulnerabilities, so defining behavior in all cases
seems better.

> +\subsubsection{Status Information}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device In=
itialization / Status Information}
> +
> +Drivers query the device status via \msgref{GET_DEVICE_STATUS} to obse=
rve
> +progress or detect errors, and they drive the Virtio status transition=
s via
> +\msgref{SET_DEVICE_STATUS}. Writing zero to the status field resets th=
e device,
> +invalidating any configuration or virtqueue state.
> +
> +\drivernormative{\paragraph}{Status Handling}{Virtio Transport Options=
 / Virtio Over Messages / Device Initialization / Status Information / Dr=
iver}
> +\begin{itemize}
> +  \item A driver SHOULD read the device status via \msgref{GET_DEVICE_=
STATUS}
> +        when diagnosing errors or determining whether the device is re=
ady to
> +        move to the next initialization phase.
> +  \item A driver MUST use \msgref{SET_DEVICE_STATUS} to drive the devi=
ce through
> +        the virtio-defined status states and MUST write 0 to request a=
 device
> +        reset when needed.
> +\end{itemize}
> +
> +\devicenormative{\paragraph}{Status Handling}{Virtio Transport Options=
 / Virtio Over Messages / Device Initialization / Status Information / De=
vice}
> +\begin{itemize}
> +  \item Upon receiving a \msgref{SET_DEVICE_STATUS} write of 0, a devi=
ce MUST
> +        reset its internal state, invalidate existing configuration an=
d
> +        virtqueue settings, and present the status field as 0.
> +  \item A device MUST report its current status accurately via
> +        \msgref{GET_DEVICE_STATUS}, including whether the FEATURES\_OK=
 bit has
> +        been accepted or cleared.
> +\end{itemize}

This is fine if all messages are processed in-order, but that is very
bad for performance (see above).  As soon as out-of-order message
handling becomes possible, a race condition will arise: replies and
notifications from before the reset can arrive after the reset.

I thknk solving this requires either having a generation or stream
number in each message, or delegating reset to the bus layer.

(snip)

> +\subsubsection{Device Notifications}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device Op=
eration / Device Notifications}
> +
> +\msgref{EVENT_CONFIG} and \msgref{EVENT_USED} provide asynchronous not=
ifications
> +from the device (or device-side bus) to the driver. The bus may forwar=
d these
> +messages in-band or synthesize them based on other signals such as int=
errupts
> +or polling.
> +
> +\devicenormative{\paragraph}{Device Notifications}{Virtio Transport Op=
tions / Virtio Over Messages / Device Operation / Device Notifications / =
Device}
> +\begin{itemize}
> +  \item A device (or device-side bus) MUST send \msgref{EVENT_CONFIG} =
whenever
> +        it makes a configuration change or status update that becomes =
visible to
> +        the driver. The message MUST include the new configuration gen=
eration
> +        count and MAY include the updated configuration data.

I would change the second line to a MUST, to avoid a round trip.

> +  \item If the configuration data is omitted from \msgref{EVENT_CONFIG=
}, the
> +        device SHOULD include the relevant offsets/lengths so the driv=
er can
> +        re-fetch the data via \msgref{GET_CONFIG}.

This makes this clause unnecessary.

> +  \item A device SHOULD send \msgref{EVENT_USED} to inform the driver =
when
> +        buffers on a virtqueue have been consumed, unless the device r=
elies on
> +        an alternative, agreed-upon completion mechanism.

Why SHOULD and not MUST?

> +\end{itemize}

(snip)

> +\msgdef{GET_VQUEUE}
> +
> +\msgref{GET_VQUEUE} returns information about a specific virtqueue, in=
cluding
> +its maximum size, current size, and, if already configured, the descri=
ptor,
> +driver, and device area addresses.
> +
> +\begin{lstlisting}
> +struct virtio_msg_get_vqueue_req {
> +        le32 index; /* virtqueue index */
> +};
> +
> +struct virtio_msg_get_vqueue_resp {
> +        le32 index;        /* echoed virtqueue index */
> +        le32 max_size;     /* maximum queue size */
> +        le32 cur_size;     /* current size (0 if unconfigured) */
> +        le32 reserved;     /* must be zero */
> +        le64 desc_addr;    /* descriptor area address */
> +        le64 driver_addr;  /* driver area address */
> +        le64 device_addr;  /* device area address */
> +};
> +\end{lstlisting}
> +
> +\devicenormative{\paragraph}{GET\_VQUEUE}{Virtio Transport Options / V=
irtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Device=
}
> +\begin{itemize}
> +  \item A device MUST report accurate maxima and current queue sizes f=
or each
> +        virtqueue and MUST return zero as the current size if the queu=
e has not
> +        yet been configured.
> +\end{itemize}
> +
> +\msgdef{SET_VQUEUE}
> +
> +\msgref{SET_VQUEUE} programs a virtqueue's size and buffer addresses. =
The driver
> +selects a queue index, supplies the desired size (not exceeding the ma=
ximum
> +reported via \msgref{GET_VQUEUE}), and provides guest-physical address=
es for the
> +descriptor, driver, and device areas.

Is the intention to still require shared memory?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------AAsZ3ntKi0V0VYX0VOSnDRKs
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------AAsZ3ntKi0V0VYX0VOSnDRKs--

--------------dCJ0rZ8UoF4DmijJ001MsSc5--

--------------aLWdFyyhvSZi1WQoIIx8x8pT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmmPdugACgkQszaHOrMp
8lN7sw/+O1Lmwlk/D3IPUWBLrWK4xbExHQHCOXv70oQ0maPsUFyu38Y5wYk9f3S9
9QmsCI2qQ+MwTQzicLLHTkaci/GF6aU5OYdMblLa/QilzGUkR3MBfi7Pg2RqDUAV
myJluyZBtZ97sgAC4NXfxn/ZFVcAaEsvh9T07vvGEEFhQMqNoUeXhS9T4HUuuoCv
fldynmk9yTeZLQKYQwMxv76+9dZYpUsdFm6CZzm0gXWasfNN3itMCGLS3TDr5NqG
pVfd8bab1G+VBIjDgeo8PgpSnRu5V84BqyRB9nQr6rF3Yfwn7Mwaxp3CUt+wXfqE
wUTlkkfSbYK2KKXEUuFZ9+tCDo17VFfm/thslL9ws4BL7yis4bQ/XIn40kH+keJC
1+Y1nP1nL6nzFQUnCWqIqWGAReqaqhrOKGFi7yWv5ZOc+dXsHpMEdfOqd9AAf9G2
G8ll0NnypLnpjIx582v33x6j+qiucyNrQWaSj9vv1Ap4rLqJzYX5ilAoydWl/3uC
YMBR+c3qx+E8drtezriSqjt/+W6DELW4M+n1gaGrIRX0BSRjiRLTpYHI1O9dRp0j
z4KmzSHEGxg/hOyZWLNBfLdB2Dpb5xbuBog+vrI4XJjvGtD1tTvMT7nhB91p9DrK
e7x5N+RvGIPaaSg6aCSUcTd9ZJi48Vx1vN6GU2tJ6L+ymsaRa7k=
=C52G
-----END PGP SIGNATURE-----

--------------aLWdFyyhvSZi1WQoIIx8x8pT--
