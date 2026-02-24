Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292441A9F93
	for <virtio-comment@lists.linux.dev>; Tue, 24 Feb 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947726; cv=none; b=AwFcAdtvLgfzfj4TSnfMZzvl3j4W7V/cHdJHFWFnQWTeYjLXMxaStgk3NyEE+nAF0DbOnxZrMr7sYJ+fMBWix6bddj2Q8YhQecDP9RPWuZdTU2ftWpMTMIx+IfrGc910cXJSwdxpc+L6lQ7S6PlpDqjnPfTnPWefccfeYF+VrNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947726; c=relaxed/simple;
	bh=XxmnfeHvQILcaorihNB1q2rPAO36xtWJKAJM+iAN7Y4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gr7G0cAdKxCz5NmwTWpzxfz2AvzJhd2g0KIRFl0BU2U/czsE4XjPtjp4JmhDJaRgM79/bANgIg2ST0si0qacrV7FZ+Lc5JFrBzPoWnvItSHJqTl11QsaQNmGJDvWN66XYuD1tt3TOFMNoA9eVTaN0gaDmcGG8KdUto3ia6wX2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTUeVZTo; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTUeVZTo"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-797d6f934e2so55198387b3.0
        for <virtio-comment@lists.linux.dev>; Tue, 24 Feb 2026 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947724; x=1772552524; darn=lists.linux.dev;
        h=autocrypt:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qdmQqhbVj6DPBZ8gagodrLmogf4JL/NWECtX9pCIu9Y=;
        b=bTUeVZTo9UKmXGl9UvAQW9zIp68g1JJ0++GtIOax8sWd7Cv2J5O0HtKlrmLeeVPnDT
         c90PJRRZPME5tQIimNZPMTVI5QS1s8Gw+IYCsS5m90KvAthgTGK583hY/RXt8MXRlCb4
         2BojPlbjJyqUd9wxYyxxZST7RKoE88e2ewZ80XNA2tBbz3zjP8uPHWV/OScbd4iavK7s
         pJlhiXf75PG55RijKMFQb3+scvePK/Y3k2qvOr9vRf4OcoNHH/czRTxC1jFv381qmWBY
         0USlmxGD9WQMBg28LgohOjIPUbHd9T2NW+AOb9NHKwzbbWpbUPnH9CuvLcGLl3612N1H
         K5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947724; x=1772552524;
        h=autocrypt:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdmQqhbVj6DPBZ8gagodrLmogf4JL/NWECtX9pCIu9Y=;
        b=oztU8/HoXXwkSXn9Rp5ywVx+j148Zf6C175jGz9mdd8P0ZxiyWCBk8T1BIIV+rzMPn
         yxVwSCoFJwtMLdrO/Mn+TrazHdu3sfFDOme0KVweKIQKt7/yzzW+QlWYbCW5ZSN64YoT
         EqsWWEGfCvyha8P3zRAeuiLhM1C1fjHvnp3hDz4WqKVD04jZzDKbESlRzRBVC6PPFm2v
         gHZYIRMWSirge2e5P87VORC+v1RhgvrAyMiejLYJkEfMwLMCWRGktgLnVrNEpa379wZ6
         nqOIzlySRG1aZWTTIpGNOSYIyOk4ofZizjhvDrvde+3XFD8ZGcSdjunx6+ieO8S9lGBg
         erzA==
X-Forwarded-Encrypted: i=1; AJvYcCWHDG85jPqw/Yl0pFHnPTB1867CG7w4KikIfbag+xF90Yy21FFE23isSD2ErG0g3NitBjbN8gZuCkmLLfVUhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeLZKRgrN2RLI0kLzIYL02P8vE78enZ/hyMLts4MgmmAt9D58w
	mpZtTlxANKlR1nzvGb95PwEb2d+QkmhpNJrTC9vJu20psue8w08fQcSM
X-Gm-Gg: ATEYQzw2kau3r/VYkJJTwwl2pARL2apRIFDOB297fU4ws9YYvJSBpDPRq/SaB28FqQO
	dX5EWSqle+Ra8woE3gFycZkuGYjwqkw69qnGB5qyOrjSEp0Gegtv5caJiaE+ua17ia//UzzLwmY
	qwu6iZbTWqBfrbiX3z8UyTiD7jyrqUPZ8vk6oPvI8bY6cU3duxdJioCD2Th4O4vkYAbncwVZcCu
	1M+pzO1dTU67Tzy14cWmp/nYkBhEWPTqUqSFCmL+dJDoAb1KclGu96Hfp9fMO77NHS2H1IkkEpx
	al0cLuS+6LrQn8oEf698nDqhfaPjP2Xj9yRK1JzD/0ec2MC0XkaiBA5JoSZSoun9nVJM5uqNSmM
	AfM5uShCzqCek+0MxZQasdNlM8dYdmKeBYvYVpbHDHXJwbZxEGO1jrFkYX2v2ouyGmd9q52Ci7w
	3vxzo0S5x26p9ppfFKI8V8jhDKdeWtECtYuEl0AstBsDenqmpMFPmms3cLYXDhr+obrpiGcQNSR
	CFpWYeYkmJbgSad7WyiiU+JIU1Q6KYa0PhFU8wf6eBwb9iA5JgW
X-Received: by 2002:a05:690c:95:b0:793:bc67:da0a with SMTP id 00721157ae682-7982903d449mr102204857b3.47.1771947723026;
        Tue, 24 Feb 2026 07:42:03 -0800 (PST)
Received: from [10.138.34.110] (h69-131-216-128.cncrtn.broadband.dynamic.tds.net. [69.131.216.128])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79865461664sm511017b3.16.2026.02.24.07.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 07:42:02 -0800 (PST)
Message-ID: <c0e37ee7-9631-4611-ace2-43609dc11ab2@gmail.com>
Date: Tue, 24 Feb 2026 10:41:59 -0500
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>,
 Alyssa Ross <hi@alyssa.is>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
Content-Language: en-US
In-Reply-To: <20260126163230.1122685-3-bill.mills@linaro.org>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9YbDvCcz0uV0qPSP7fHcWkmj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9YbDvCcz0uV0qPSP7fHcWkmj
Content-Type: multipart/mixed; boundary="------------KsMKUIbEQvS30Tn637RY2a3k";
 protected-headers="v1"
Message-ID: <c0e37ee7-9631-4611-ace2-43609dc11ab2@gmail.com>
Date: Tue, 24 Feb 2026 10:41:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>,
 Alyssa Ross <hi@alyssa.is>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
Content-Language: en-US
In-Reply-To: <20260126163230.1122685-3-bill.mills@linaro.org>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Autocrypt-Gossip: addr=hi@alyssa.is; keydata=
 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
 9KKY1Fh8LBKH

--------------KsMKUIbEQvS30Tn637RY2a3k
Content-Type: multipart/mixed; boundary="------------0nNhFqgXpUGIkXRh0NnqkTQT"

--------------0nNhFqgXpUGIkXRh0NnqkTQT
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

Is it possible to map a virtio-mmio or virtio-pci device to virtio-msg?
For instance, can a VMM present a virtio-mmio or virtio-pci device
to its VM, while using virtio-msg to communicate with its backend?

> This transport is intended to be used in many situations, including:
> * between a host processor and its co-processors
> * between two different systems (not SMP) connected via PCIe
> * between normal and secure worlds
> * host to vm

How does this map to the vhost-user protocol [1]?  Vhost-user is a very
common way to implement devices and it would be nice for virtio-msg
to cleanly map to it.  Requiring a separate AF_UNIX transport could
be quite disruptive.

[1]: https://www.qemu.org/docs/master/interop/vhost-user.html

> * vm to vm

This requires a method for VMs to implement devices, not just drivers.
For Xen and FF-A this is easy, provided that there is an out-of-band
means to enumerate which devices should be implemented.  However,
these mechanisms are not hypervisor-agnostic.

It would be much better to have a standard virtio device that backends
could use to implement virtio-msg devices.  There have been multiple
attempts at a virtio vhost-user device backend [2], but it was never
widely deployed.

[2]: https://stefanha.github.io/virtio/vhost-user-slave.html

> Signed-off-by: Bill Mills <bill.mills@linaro.org>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++=

>  1 file changed, 1640 insertions(+)
>  create mode 100644 transport-msg.tex
>=20
> diff --git a/transport-msg.tex b/transport-msg.tex
> new file mode 100644
> index 0000000..d4e31d7
> --- /dev/null
> +++ b/transport-msg.tex
> @@ -0,0 +1,1640 @@
> +\section{Virtio Over Messages}\label{sec:Virtio Transport Options / Vi=
rtio Over Messages}
> +
> +\newcommand{\conceptref}[1]{\hyperref[sec:Virtio Transport Options / V=
irtio Over Messages / Basic Concepts / #1]{#1}}
> +\newcommand{\msgref}[1]{\hyperref[sec:Virtio Transport Options / Virti=
o Over Messages / Transport Messages / VIRTIO_MSG_#1]{VIRTIO_MSG_#1}}
> +\newcommand{\busref}[1]{\hyperref[sec:Virtio Transport Options / Virti=
o Over Messages / Bus Messages / BUS_MSG_#1]{BUS_MSG_#1}}
> +\newcommand{\msgdef}[1]{\subsubsection{VIRTIO_MSG_#1}\label{sec:Virtio=
 Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_M=
SG_#1}}
> +\newcommand{\busdef}[1]{\subsubsection{BUS_MSG_#1}\label{sec:Virtio Tr=
ansport Options / Virtio Over Messages / Bus Messages / BUS_MSG_#1}}
> +
> +This section defines \textbf{virtio-msg}, a transport mechanism that e=
ncapsulates
> +virtio operations as discrete message exchanges rather than relying on=
 PCI or
> +memory-mapped I/O regions. It separates bus-level functionality (e.g.,=
 device
> +enumeration, hotplug events) from device-specific operations (e.g., fe=
ature
> +negotiation, virtqueue setup), ensuring that a single, generic transpo=
rt layer
> +can be reused across multiple bus implementations.
> +
> +virtio-msg addresses several key objectives:
> +
> +\begin{itemize}
> +  \item \textbf{Support multiple bus implementations:}
> +  Systems can rely on various communication methods such as hypercalls=
, local
> +  IPC, network channels, or device trees for enumerating devices. virt=
io-msg
> +  defines a common transport interface suitable for any of these mecha=
nisms.
> +
> +  \item \textbf{Reduce per-bus complexity:}
> +  Buses can implement a fully message-based workflow (including option=
al
> +  enumeration via \busref{GET_DEVICES} and hotplug via \busref{EVENT_D=
EVICE})
> +  or they can discover and manage devices through
> +  alternative means such as platform firmware data. In either case, th=
ey
> +  forward transport messages to and from each device.
> +
> +  \item \textbf{Preserve virtio semantics:}
> +  The transport leverages standard virtio concepts (features, configur=
ation
> +  space, virtqueues), so existing virtio drivers and device implementa=
tions can
> +  integrate smoothly once a device is discovered and registered.
> +\end{itemize}

I see that there is support for device enumeration by drivers.
What about driver enumeration by devices?  An FF-A endpoint or Xen VM
needs to know which devices it should implement.  In embedded systems,
this can be obtained from the device tree or ACPI.  However, dynamic
systems need to create and destroy devices at runtime.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------0nNhFqgXpUGIkXRh0NnqkTQT
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

--------------0nNhFqgXpUGIkXRh0NnqkTQT--

--------------KsMKUIbEQvS30Tn637RY2a3k--

--------------9YbDvCcz0uV0qPSP7fHcWkmj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmmdxscACgkQszaHOrMp
8lNpPBAApVFwzSMC9gk7xbdENJw3naum+LJbM34tEjMDMqA7RLpz52zIM4/PMqlT
asdK1sllrV4OMo9SQPV+146ZBLanYUsMc073eqYeMcLGc5q6qicwAeFfnV+0N0Ku
Z/BdOuKjBiGpeSCD1F43uBmBNeq4KMGnWv0JvZZEJfTEdy608cHtwqKyyGDsB3pU
W9eBg6srQvw5JSVBE83xdO/mRJjZgz5r8YZ1loZ14rVEQPIyAwlq6pDdoKSZ8feh
5zaMP5xwMGJToBRhM88O6UF4wxYIN+ugjIa6pQ0BgXUT9ciFKW+sb0VHMj+j5jUh
kDJSID5v5rAJB5PqoYplomBREthU3KXh8kUutKCFFKoyt9dcLgQs6IcHyW+MvMac
i8o3nKBPi+vNvgkkPoi+5ghjPDjZPYQumvFoESWdFRrOiTXikx7AK5ZTdtW5vk7V
ToH37yb7MY1wsXGva49DoD8igPzM+t4MJTjLY9dTIDCNAnrDZ1CQAromkTt8EFA+
g/dgzX+mUXOX9dN00WeAH2S/q4ugL0XXU1FJl/12AgGw6yF9oR/U9550iXUAeR/M
9kkbHNgbHb2k8HjwlMPowZP9jfqj0XNDHSxzVBCCq3KTs4M9txt6j6qXerZ2/E9X
g3OQJGfk67M70ZJzinM1bA0ajMip1jEbyVmpsctedLXUzWSvIlU=
=Gqf8
-----END PGP SIGNATURE-----

--------------9YbDvCcz0uV0qPSP7fHcWkmj--
