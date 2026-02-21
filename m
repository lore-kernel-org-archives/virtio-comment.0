Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665278F7D
	for <virtio-comment@lists.linux.dev>; Sat, 21 Feb 2026 02:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639512; cv=none; b=aq5dmLSmicfAhmMqb7VpgA8HIii1IkFti9ixDiTsTLRqEqjlZWj267wmIwmoKyBLv1nteEZlkZi2JXKfAv7XV/4c0U6RKzhJDa24MGCMvkd1Qx8dOTG4ECBrzh77g0V31urPD9q5n6zijS2Y2HD/Ay8/Zx2cuNf8zUORqZbc860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639512; c=relaxed/simple;
	bh=JJB8AyQ5xakuKjoZIODlYwxs+XM6KsXVDwcAgv/L0gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6wOpbma8rg8XC1wToZ4TYSb9p/Bu8Z38H7R6Yq97YQ6tZSHsqB+WYMQBGj8sj1L1A651k8eKW7FCPLz6ksKjjvjTb46+mMGuueOaVSPg84ngEC8b8OeJbfZkYYyC2MSc6XZ96PhPIZ1FJcmSaqe3SkdF9P1Wkvf91uPyc0du2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5CIA+93; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5CIA+93"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79827d28feaso7022507b3.3
        for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 18:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771639509; x=1772244309; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D16DWr2AgJd1I+8bvqOI5UiYu4pCYkilxJdrSXf+sxQ=;
        b=Q5CIA+93w1LT9+yTwUPKEFUTpuXy+d5k7mDTj0fpp3eukb+3qsuM5E9p3uIwsnWoOQ
         XkVQPN5VzIPeFYAbXrRxTY7DO7dADn9e85QFfXTCSU7iH2hAR7+KH72BpPcOQyHF5gpB
         V0rBVO2PslW4zvnswu7/nYnAR2XQqgfApnDHIPpw2BvPsm1Lxeb2aPEK1XlC9FmmQBHS
         HYZn9aUIq38MHjW4u778cF/HS7H0zSG55RMxnj3G34AXwqOIj8lrDzCTpsO9EO4Lvljt
         ahXHAtn8J5Nin9ayv/062R26ENWg+kg6uVimzv20g5GxQigo1v7zUEmi8Y1Po8TnEZXi
         oSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771639509; x=1772244309;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D16DWr2AgJd1I+8bvqOI5UiYu4pCYkilxJdrSXf+sxQ=;
        b=K2MF1AfbD+xn0ONS9GEAkOMDNbWPmdCsuafBGJQGwDBqlqnAW0Fn/hSPUigjNeXVD/
         RWfucYTJA3VPibOIXKqZEMTj/MkqWqGpMtQxyLIq5AxhGKzfQg3G88d4qgA3hm9879Ml
         E51D0KRah5Ozw6XrQ1tHh7OFYS47Yk7rbfc8wcG2okaZog2SO2iucWMB5CAYCW0mRDMB
         Bovom6GVOZ4hUlZPCd6LQyybhFdVDR4ZDvB7noyLC2grK+Zcob9Tdn3O4diwLTfVkxXw
         OEEWIu7OAJ/Z3PEHrjNNom66uJTHEm5jHFFl1eTDr0P5UiUNZxYbDzVi488uy9Vh4qYY
         KQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCU8ii4QB4fIyGlvVtTHAEO1wv6UBcV6WiOuEjHw9/pt8/E/A8Hf64hnPul25RnKqMea0SKM04HUeXDp8SVH4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXk245QtyfF9GYiVrx5nLvhtYT35J6PN2E8BDX/9bpYXTfssHh
	5t4/iKSQVzha5P1Fg0YGOgY5FxdB8um1jQrlVjWhdIVat0DkoKcRVNPZ
X-Gm-Gg: AZuq6aI9BSKVjsog4thP3Y3Wcyt/YFGrEEnK//u85pA1LEyi4NiMoSRjfb26kJdrnRT
	N9GGQ0rER4hQudavknOwmyd+GAWlbmDqIq8RC8UY7Xx/iSvU54BWK7mdroFeEAb16Kj4GDBe66x
	w38VfMeDH6RZKb9hAPxGyG/DkHUwe3H0y9CA3U580nKRj/4f3dsnMmzDmKirnGl9mxxd8giQpN7
	Asj7Bd4Hr3MaTwPvxPwwLqmzqCN0BaPVpoBmXvO5U/g30fGzvl8kl//3O5sy6dliGYNbnyqrhD6
	YUC6cvhZfXg8XdX/wfX9XxB3eMpTkeYrf6nID09/tCWeiLGW/zbydRb63S2z95cF4RADBxEy9nn
	joyeBim2gMU1Wf+MyuCM1Ze0xk6TBf/NRAuutgdZsOfnIuM9V0yt5NOpf4vFdDg/I2+bMsGU0/P
	QW+L8o8ZsG0IOx5f2XYK3EJVhxbWtzYVJtb7Qje5Q41IC2mXLL30FuROkuC+h2D7iyKaMJlBoEA
	cYIOZ65vXT0/DdpDNt3j0fFvGs2hsPk688JpTVF9A==
X-Received: by 2002:a05:690c:14:b0:794:e634:edea with SMTP id 00721157ae682-79828efe7d4mr17635197b3.14.1771639508990;
        Fri, 20 Feb 2026 18:05:08 -0800 (PST)
Received: from [10.138.34.110] (h69-131-216-128.cncrtn.broadband.dynamic.tds.net. [69.131.216.128])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982de0fd63sm3992537b3.46.2026.02.20.18.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 18:05:08 -0800 (PST)
Message-ID: <9647c9bf-3f62-42fe-ad07-7e9dacc613dd@gmail.com>
Date: Fri, 20 Feb 2026 21:04:50 -0500
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <6b4a7cfe-15bc-45cf-9fdf-ae99aafbfc15@gmail.com>
 <EC730EB8-9CEB-4B50-9295-2E1A908E22EF@arm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <EC730EB8-9CEB-4B50-9295-2E1A908E22EF@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9iLtB6tesD35vuNyGpcGS8CQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9iLtB6tesD35vuNyGpcGS8CQ
Content-Type: multipart/mixed; boundary="------------U509dy6wWVJLfBQ0WK4iNIER";
 protected-headers="v1"
Message-ID: <9647c9bf-3f62-42fe-ad07-7e9dacc613dd@gmail.com>
Date: Fri, 20 Feb 2026 21:04:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <6b4a7cfe-15bc-45cf-9fdf-ae99aafbfc15@gmail.com>
 <EC730EB8-9CEB-4B50-9295-2E1A908E22EF@arm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <EC730EB8-9CEB-4B50-9295-2E1A908E22EF@arm.com>

--------------U509dy6wWVJLfBQ0WK4iNIER
Content-Type: multipart/mixed; boundary="------------A8Ss9xe0Zgi0MzfhrqCfsrkO"

--------------A8Ss9xe0Zgi0MzfhrqCfsrkO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2/20/26 03:52, Bertrand Marquis wrote:
> Hi Demi,
>=20
>> On 13 Feb 2026, at 20:09, Demi Marie Obenour <demiobenour@gmail.com> w=
rote:
>>
>> On 1/26/26 11:32, Bill Mills wrote:
>>> Add a new transport layer that is based on messages.
>>>
>>> This transport layer still uses virtqueues as the other transport lay=
ers do
>>> but implements transport layer operations by sending and receiving me=
ssages
>>> instead of the "MMR" reads and writes used in virtio-mmio and virtio-=
pci.
>>>
>>> This transport is useful when the device and driver are both implemen=
ted in
>>> software but the trap and emulate operations of virtio-mmio and virti=
o-pci
>>> can not be used.
>>
>> (snip)
>>
>>> +\subsubsection{Message Ordering}
>>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic C=
oncepts / Ordering}
>>> +
>>> +Transport messages fall into two classes: requests (which expect res=
ponses) and
>>> +events (which are one-way). Drivers and devices rely on the bus to p=
reserve the
>>> +relative ordering of request/response pairs for each device number; =
they do not
>>> +interpret the \field{token} field directly.
>>
>> I expect that this requires all messages for a given device to be
>> processed sequentially, which is not going to be fast.  At the very
>> least, messages on different virtqueues should be able to be processed=

>> out of order.
>>
>> I would have some sort of stream identifier that is made visible to
>> the bus layer.  This would map to a QUIC stream, a single ring buffer,=

>> or something else that ensures in-order delivery.  Messages with
>> different stream identifiers may be processed out of order.
>=20
> We have the token meant to be used to reorder messages or make them cor=
respond to a request.
>=20
> Now we choosed on the first version to enforce the order to prevent hav=
ing something that would not
> work in the existing virtio implementation where drivers are not design=
ed to handle this (configuration
> space access is done in order and is not expected to get answers coming=
 back randomly when reading it).
>=20
> Now I do agree that this could be a place for performance optimization =
and it would be possible to (as pointed
> out by Mickael) introduce this as a feature bit so that implementation =
could support that or not and disable it.
> This could be handled at bus level or directly on the device side.

This was made under the (mistaken) assumption that virtqueue data was
also sent over messages.  An ordering requirement for that _would_
be a performance problem.

I do believe that virtqueue notifications (data available/data
consumed) should be allowed to be received out of order.  There is no
requirement that these be _sent_ in any particular order, so further
reordering by the bus isn't going to make things worse.

>>> +\busnormative{\paragraph}{Message Ordering}{Virtio Transport Options=
 / Virtio Over Messages / Basic Concepts / Ordering / Bus}
>>> +\begin{itemize}
>>> +  \item For each device number, a bus implementation MUST deliver re=
sponses to
>>> +        the driver in the same order that it forwarded the correspon=
ding
>>> +        requests to the device.
>>> +  \item A bus implementation MUST ensure that every request forwarde=
d to a
>>> +        device results in exactly one response delivered to the driv=
er (unless
>>> +        the request is defined as an event).
>>> +\end{itemize}
>> What is the reason for the device/driver distinction here?
>> Intuitively, I expect both requests and responses to just be messages
>> at the bus layer.
>=20
> At the bus layer there are only requests and responses but at the end o=
n the device
> side you only get requests that you have to answer or event that you se=
nd. There is
> no case of request send by the device side which would require an answe=
r from the
> driver side.
> This why we have this here but we could relax it if you think this coul=
d be useful.

I think this would be better written as a constraint on devices, rather t=
han as
a constraint on buses.  Right now, it reads as if the bus is responsible =
for
ensuring messages are replied to.

>>> +\devicenormative{\paragraph}{Feature Negotiation}{Virtio Transport O=
ptions / Virtio Over Messages / Device Initialization / Device Features /=
 Device}
>>> +\begin{itemize}
>>> +  \item When handling \msgref{GET_DEVICE_FEATURES}, a device MUST re=
turn zero
>>> +        for any requested bits that fall outside the number of featu=
re bits it
>>> +        implements.
>>> +  \item After receiving \msgref{SET_DRIVER_FEATURES}, a device MUST =
update its
>>> +        internal feature mask to match the acknowledged set and MUST=
 reflect
>>> +        acceptance or rejection by leaving the FEATURES\_OK bit set =
or clearing
>>> +        it in the status returned by \msgref{SET_DEVICE_STATUS}.
>>> +\end{itemize}
>>
>> What should the device do if it doesn't support the feature?
>=20
> This is what we meant to say with acceptance/rejection. If something is=
 not accepted
> the FEATURES_OK bit will not be set in the message returned.
> Maybe we need rephrasing to make that clearer ?

I agree.

>>> +\devicenormative{\paragraph}{Virtqueue Configuration}{Virtio Transpo=
rt Options / Virtio Over Messages / Device Initialization / Virtqueue Con=
figuration / Device}
>>> +\begin{itemize}
>>> +  \item A device MUST report accurate maximum queue sizes in \msgref=
{GET_VQUEUE}
>>> +        and MUST persist the parameters supplied via \msgref{SET_VQU=
EUE} (size,
>>> +        descriptor, driver, and device addresses).
>>> +  \item When \msgref{RESET_VQUEUE} is issued (and VIRTIO\_F\_RING\_R=
ESET is
>>> +        negotiated), the device MUST quiesce the queue, release any =
resources
>>> +        associated with it, and allow the driver to reconfigure it.
>>> +\end{itemize}
>>
>> What should a device do if it gets a request that a driver is
>> forbidden from making?  Untested corner-cases tend to be a good
>> source of security vulnerabilities, so defining behavior in all cases
>> seems better.
>=20
> This is to be handled at the bus level which should return an error to =
the transport.
> FF-A bus defines an error message so that the sender bus when receiving=
 it back
> for a request can give an error back to the transport.
>=20
> Maybe we should describe this model in non normative way in the spec ?
>=20
>=20
>>
>>> +\subsubsection{Status Information}
>>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device =
Initialization / Status Information}
>>> +
>>> +Drivers query the device status via \msgref{GET_DEVICE_STATUS} to ob=
serve
>>> +progress or detect errors, and they drive the Virtio status transiti=
ons via
>>> +\msgref{SET_DEVICE_STATUS}. Writing zero to the status field resets =
the device,
>>> +invalidating any configuration or virtqueue state.
>>> +
>>> +\drivernormative{\paragraph}{Status Handling}{Virtio Transport Optio=
ns / Virtio Over Messages / Device Initialization / Status Information / =
Driver}
>>> +\begin{itemize}
>>> +  \item A driver SHOULD read the device status via \msgref{GET_DEVIC=
E_STATUS}
>>> +        when diagnosing errors or determining whether the device is =
ready to
>>> +        move to the next initialization phase.
>>> +  \item A driver MUST use \msgref{SET_DEVICE_STATUS} to drive the de=
vice through
>>> +        the virtio-defined status states and MUST write 0 to request=
 a device
>>> +        reset when needed.
>>> +\end{itemize}
>>> +
>>> +\devicenormative{\paragraph}{Status Handling}{Virtio Transport Optio=
ns / Virtio Over Messages / Device Initialization / Status Information / =
Device}
>>> +\begin{itemize}
>>> +  \item Upon receiving a \msgref{SET_DEVICE_STATUS} write of 0, a de=
vice MUST
>>> +        reset its internal state, invalidate existing configuration =
and
>>> +        virtqueue settings, and present the status field as 0.
>>> +  \item A device MUST report its current status accurately via
>>> +        \msgref{GET_DEVICE_STATUS}, including whether the FEATURES\_=
OK bit has
>>> +        been accepted or cleared.
>>> +\end{itemize}
>>
>> This is fine if all messages are processed in-order, but that is very
>> bad for performance (see above).  As soon as out-of-order message
>> handling becomes possible, a race condition will arise: replies and
>> notifications from before the reset can arrive after the reset.
>>
>> I thknk solving this requires either having a generation or stream
>> number in each message, or delegating reset to the bus layer.
>=20
> The token is meant for that and as said in other mails, we will investi=
gate the solution to
> introduce a feature bit to enable/disable out-of-order to leave a door =
open to such optimizations.

See above.

(snip)

>>> +  \item A device SHOULD send \msgref{EVENT_USED} to inform the drive=
r when
>>> +        buffers on a virtqueue have been consumed, unless the device=
 relies on
>>> +        an alternative, agreed-upon completion mechanism.
>>
>> Why SHOULD and not MUST?
>=20
> If polling is used, there might be cases where this will never be sent.=

> Maybe this should be a MUST with something like "unless polling is used=
" or something
> like that.

What about this?

+  \item A device MUST send \msgref{EVENT_USED} to inform the driver when=

+        buffers on a virtqueue have been consumed, unless the device rel=
ies on
+        an alternative, agreed-upon completion mechanism such as polling=
=2E

>>> +\end{itemize}
>>
>> (snip)
>>
>>> +\msgdef{GET_VQUEUE}
>>> +
>>> +\msgref{GET_VQUEUE} returns information about a specific virtqueue, =
including
>>> +its maximum size, current size, and, if already configured, the desc=
riptor,
>>> +driver, and device area addresses.
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_msg_get_vqueue_req {
>>> +        le32 index; /* virtqueue index */
>>> +};
>>> +
>>> +struct virtio_msg_get_vqueue_resp {
>>> +        le32 index;        /* echoed virtqueue index */
>>> +        le32 max_size;     /* maximum queue size */
>>> +        le32 cur_size;     /* current size (0 if unconfigured) */
>>> +        le32 reserved;     /* must be zero */
>>> +        le64 desc_addr;    /* descriptor area address */
>>> +        le64 driver_addr;  /* driver area address */
>>> +        le64 device_addr;  /* device area address */
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +\devicenormative{\paragraph}{GET\_VQUEUE}{Virtio Transport Options /=
 Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Devi=
ce}
>>> +\begin{itemize}
>>> +  \item A device MUST report accurate maxima and current queue sizes=
 for each
>>> +        virtqueue and MUST return zero as the current size if the qu=
eue has not
>>> +        yet been configured.
>>> +\end{itemize}
>>> +
>>> +\msgdef{SET_VQUEUE}
>>> +
>>> +\msgref{SET_VQUEUE} programs a virtqueue's size and buffer addresses=
=2E The driver
>>> +selects a queue index, supplies the desired size (not exceeding the =
maximum
>>> +reported via \msgref{GET_VQUEUE}), and provides guest-physical addre=
sses for the
>>> +descriptor, driver, and device areas.
>>
>> Is the intention to still require shared memory?
>=20
> Shared memory can be used and we have a message for that.
>=20
> To be able to use virtqueues and dma between device and driver memory m=
ust be made accessible
> to the other side as it is the case for other transports.

Should these be I/O virtual addresses instead of guest physical addresses=
?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------A8Ss9xe0Zgi0MzfhrqCfsrkO
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
YXJpZSBPYmVub3VyIChJVEwgRW1haWwgS2V5KSA8ZGVtaUBpbnZpc2libGV0aGlu
Z3NsYWIuY29tPsLBjgQTAQgAOBYhBHaHTZ8TNroiWQcccbKItV//nCLBBQJgOEV+
AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJELKItV//nCLBKwoP/1WSnFdv
SAD0g7fD0WlF+oi7ISFT7oqJnchFLOwVHK4Jg0e4hGn1ekWsF3Ha5tFLh4V/7UUu
obYJpTfBAA2CckspYBqLtKGjFxcaqjjpO1I2W/jeNELVtSYuCOZICjdNGw2Hl9yH
KRZiBkqc9u8lQcHDZKq4LIpVJj6ZQV/nxttDX90ax2No1nLLQXFbr5wb465LAPpU
lXwunYDij7xJGye+VUASQh9datye6orZYuJvNo8Tr3mAQxxkfR46LzWgxFCPEAZJ
5P56Nc0IMHdJZj0Uc9+1jxERhOGppp5jlLgYGK7faGB/jTV6LaRQ4Ad+xiqokDWp
mUOZsmA+bMbtPfYjDZBz5mlyHcIRKIFpE1l3Y8F7PhJuzzMUKkJi90CYakCV4x/a
Zs4pzk5E96c2VQx01RIEJ7fzHF7lwFdtfTS4YsLtAbQFsKayqwkGcVv2B1AHeqdo
TMX+cgDvjd1ZganGlWA8Sv9RkNSMchn1hMuTwERTyFTr2dKPnQdA1F480+jUap41
ClXgn227WkCIMrNhQGNyJsnwyzi5wS8rBVRQ3BOTMyvGM07j3axUOYaejEpg7wKi
wTPZGLGH1sz5GljD/916v5+v2xLbOo5606j9dWf5/tAhbPuqrQgWv41wuKDi+dDD
EKkODF7DHes8No+QcHTDyETMn1RYm7t0RKR4zsFNBFp+A0oBEAC9ynZI9LU+uJkM
eEJeJyQ/8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd
8xD57ue0eB47bcJvVqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPp
I4gfUbVEIEQuqdqQyO4GAe+MkD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalq
l1/iSyv1WYeC1OAs+2BLOAT2NEggSiVOtxEfgewsQtCWi8H1SoirakIfo45Hz0tk
/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJriwoaRIS8N2C8/nEM53jb1sH
0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcNfRAIUrNlatj9Txwi
vQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6dCxN0GNA
ORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog
2LNtcyCjkTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZA
grrnNz0iZG2DVx46x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJ
ELKItV//nCLBwNIP/AiIHE8boIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwj
jVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGjgn0TPtsGzelyQHipaUzEyrsceUGWYoKX
YyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8frRHnJdBcjf112PzQSdKC6kqU0
Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2E0rW4tBtDAn2HkT9
uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHMOBvy3Ehz
fAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVss
Z/rYZ9+51yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aW
emLLszcYz/u3XnbOvUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPt
hZlDnTnOT+C+OTsh8+m5tos8HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj
6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E+MYSfkEjBz0E8CLOcAw7JIwAaeBTzsFN
BGbyLVgBEACqClxh50hmBepTSVlan6EBq3OAoxhrAhWZYEwN78k+ENhK68KhqC5R
IsHzlL7QHW1gmfVBQZ63GnWiraM6wOJqFTL4ZWvRslga9u28FJ5XyK860mZLgYhK
9BzoUk4s+dat9jVUbq6LpQ1Ot5I9vrdzo2p1jtQ8h9WCIiFxSYy8s8pZ3hHh5T64
GIj1m/kY7lG3VIdUgoNiREGf/iOMjUFjwwE9ZoJ26j9p7p1U+TkKeF6wgswEB1T3
J8KCAtvmRtqJDq558IU5jhg5fgN+xHB8cgvUWulgK9FIF9oFxcuxtaf/juhHWKMO
RtL0bHfNdXoBdpUDZE+mLBUAxF6KSsRrvx6AQyJs7VjgXJDtQVWvH0PUmTrEswgb
49nNU+dLLZQAZagxqnZ9Dp5l6GqaGZCHERJcLmdY/EmMzSf5YazJ6c0vO8rdW27M
kn73qcWAplQn5mOXaqbfzWkAUPyUXppuRHfrjxTDz3GyJJVOeMmMrTxH4uCaGpOX
Z8tN6829J1roGw4oKDRUQsaBAeEDqizXMPRc+6U9vI5FXzbAsb+8lKW65G7JWHym
YPOGUt2hK4DdTA1PmVo0DxH00eWWeKxqvmGyX+Dhcg+5e191rPsMRGsDlH6KihI6
+3JIuc0y6ngdjcp6aalbuvPIGFrCRx3tnRtNc7He6cBWQoH9RPwluwARAQABwsOs
BBgBCgAgFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmbyLVgCGwICQAkQsoi1X/+c
IsHBdCAEGQEKAB0WIQSilC2pUlbVp66j3+yzNoc6synyUwUCZvItWAAKCRCzNoc6
synyU85gD/0T1QDtPhovkGwoqv4jUbEMMvpeYQf+oWgm/TjWPeLwdjl7AtY0G9Ml
ZoyGniYkoHi37Gnn/ShLT3B5vtyI58ap2+SSa8SnGftdAKRLiWFWCiAEklm9FRk8
N3hwxhmSFF1KR/AIDS4g+HIsZn7YEMubBSgLlZZ9zHl4O4vwuXlREBEW97iL/FSt
VownU2V39t7PtFvGZNk+DJH7eLO3jmNRYB0PL4JOyyda3NH/J92iwrFmjFWWmmWb
/Xz8l9DIs+Z59pRCVTTwbBEZhcUc7rVMCcIYL+q1WxBG2e6lMn15OQJ5WfiE6E0I
sGirAEDnXWx92JNGx5l+mMpdpsWhBZ5iGTtttZesibNkQfd48/eCgFi4cxJUC4PT
UQwfD9AMgzwSTGJrkI5XGy+XqxwOjL8UA0iIrtTpMh49zw46uV6kwFQCgkf32jZM
OLwLTNSzclbnA7GRd8tKwezQ/XqeK3dal2n+cOr+o+Eka7yGmGWNUqFbIe8cjj9T
JeF3mgOCmZOwMI+wIcQYRSf+e5VTMO6TNWH5BI3vqeHSt7HkYuPlHT0pGum88d4a
pWqhulH4rUhEMtirX1hYx8Q4HlUOQqLtxzmwOYWkhl1C+yPObAvUDNiHCLf9w28n
uihgEkzHt9J4VKYulyJM9fe3ENcyU6rpXD7iANQqcr87ogKXFxknZ97uEACvSucc
RbnnAgRqZ7GDzgoBerJ2zrmhLkeREZ08iz1zze1JgyW3HEwdr2UbyAuqvSADCSUU
GN0vtQHsPzWl8onRc7lOPqPDF8OO+UfN9NAfA4wl3QyChD1GXl9rwKQOkbvdlYFV
UFx9u86LNi4ssTmU8p9NtHIGpz1SYMVYNoYy9NU7EVqypGMguDCL7gJt6GUmA0sw
p+YCroXiwL2BJ7RwRqTpgQuFL1gShkA17D5jK4mDPEetq1d8kz9rQYvAR/sTKBsR
ImC3xSfn8zpWoNTTB6lnwyP5Ng1bu6esS7+SpYprFTe7ZqGZF6xhvBPf1Ldi9UAm
U2xPN1/eeWxEa2kusidmFKPmN8lcT4miiAvwGxEnY7Oww9CgZlUB+LP4dl5VPjEt
sFeAhrgxLdpVTjPRRwTd9VQF3/XYl83j5wySIQKIPXgT3sG3ngAhDhC8I8GpM36r
8WJJ3x2yVzyJUbBPO0GBhWE2xPNIfhxVoU4cGGhpFqz7dPKSTRDGq++MrFgKKGpI
ZwT3CPTSSKc7ySndEXWkOYArDIdtyxdE1p5/c3aoz4utzUU7NDHQ+vVIwlnZSMiZ
jek2IJP3SZ+COOIHCVxpUaZ4lnzWT4eDqABhMLpIzw6NmGfg+kLBJhouqz81WITr
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------A8Ss9xe0Zgi0MzfhrqCfsrkO--

--------------U509dy6wWVJLfBQ0WK4iNIER--

--------------9iLtB6tesD35vuNyGpcGS8CQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmmZEs4ACgkQszaHOrMp
8lOF4g//U8jPUlVNf0a0j95kk3BCw4Fn+2a3YLzTm8Sx+tiMDNFzY0c2S0U2c+9Y
DO23wl4ZpjMjVS7ddhe0TljerX2WhIqH7BtLK0RiipuKLn0CLTEHf0yjcB2SrB0i
svjiO/7hB7h0xmMtDfUo6IrTUVeQSSR5yC51s6z79FOGv7dbbS+SRf2KkAuYNSVL
D7Mp0p25GT0nKRBZ9BOvCDC36isNvnvHFlFtd/hfmdvd+i4qXSBEvVtWfGJtxjW7
xhsTV+2LC7fzUZxPdR22iq55OOgSLhjUHKTwIP+xvbXIpKLZonZF0GvolhmSp9ER
RFL7eyEUuKuhsZ01iIZuXvetSgm6clmPDecLGv3fY0Y/7OvUmVSLY2PXpvWqt08D
QtBPlwqqwT06kv3tDRZzBVG1mlkK4vdA3XKQrZ/fPE4M9rKg8uOr/FJ/5fg1/fe+
G+vETf78TixmcQYZ12GGr8i2ocfj/tpKWspWBFyjj0/OlIaqZu4jfVM/8jjclXjB
dWR2SeSgiVcTNDi4lKZwd68q0SH9MnyxesRIJeEbxKP0VuhjVHXlz3sUd8TXrWcj
hOlT7Qr+yqO4KAoMhNBgDEztEWcWP4FRk5F6Tzyc3md956yIwlkq0DbgtkZRssF1
HjQuk0NXadoKEa0EUiGiBv3koXODyJqzfRR66R5Ed/gaWlE1ACI=
=MTkj
-----END PGP SIGNATURE-----

--------------9iLtB6tesD35vuNyGpcGS8CQ--
