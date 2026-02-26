Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA63D413D
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114026; cv=none; b=usv7AURdPE0JLwkvMW5uYlhtfS8TGKF9VbAjDG/67fzcAT7sqxJrRrb3C2gEEwQ3BQlbYMCTr5ehjH11Wj0jRw+oAEP1WTli8ij2GryDvOZXzeVw3EmnNxk/wGYlrvJHx6IzV6M+2x7w42+hFF1Pftmv/3eLyooJzP+PEMuIP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114026; c=relaxed/simple;
	bh=tceHA42fAidR/jLKKyz2NCjGR1NS8vFNZ0dZDwwQFOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWu+4fpsWDH+Is8EtFurmwZT2yfJYy4b7ju7gsovYlVr1tPiDfdqooCCTk/5sX/6QmNfFWuB0+xHNCiA4YPpsIXuyeXF3qGXRxAV6xPknCxhfsd+FhdyWnzyJZbqhMAP2q3khrtYKKY3NoPE0dpxdvqRZK3T6oVbLKSLLbH2ScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5oQqlwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2IM3yv2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5oQqlwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2IM3yv2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKjbg2376141
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 13:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q9Shq4KBnO1BT1sTI3FZGjg2
	BuIm+84BpBu00JwTwD8=; b=O5oQqlwv7gZMLq7IgY+O2A4AByBZymmJcAWSzYiB
	pFf5vaRK4qJXGV/8rCunCzUv9MYrWBgHcTqyQ2DhL7o4L7OFfRPcpvljiNWz1aNc
	IOuvASIVeNr+0lESoDPl4HH30H6C79ssozwa27yStlFhPXRXuhwRKnqj66eUgfjC
	fh8d8DN1ZVFYPNvkvE2e7xNYpj7NIrf9P9gIfgdHnsAQfUAuQW1TEW8bfWUiMIwJ
	hpScEZHYD8HfcqoNCTzQmb+VzFIv6ce0ZV+dEUDLyIJJq6fvJYFyhLRE1zEE+oJC
	aYvy0969YNQBYbY887NbSUut7ObYEZ7W8PjYqgoT+7yFhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8d8knc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 13:53:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so530498385a.2
        for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772114019; x=1772718819; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9Shq4KBnO1BT1sTI3FZGjg2BuIm+84BpBu00JwTwD8=;
        b=L2IM3yv2AXF6tLDhivB3/foLwBGptDy6mWCMrZTN7gCTR8wyA6URVy0iLpw4lIRVkC
         vKLVHsGgyj0OyEnyLvYiDTgs1drBA8RMzURNmhrERTRhXYcXX/BbB37DyMXQR/KRhKG5
         vMx2IHTgIMSZQXjD2JfdSCMwoDXwTX9oD3yoKEfYMJP0Gvz1fTnwdo671gZuWL83ZgcW
         sPIGxe7FaSAQiQ5HqzUvzdi3wxW6KCpqLaa0gg0vbOeDheqdhCfXiVVetTp6pIp4Wmxe
         SPGnXMwdng985DKIq2ThNTbQ6HEC4EMSijInTd2+Y8D/9Sp1mGWFG243mzVkOsUyQ/9w
         bgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114019; x=1772718819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9Shq4KBnO1BT1sTI3FZGjg2BuIm+84BpBu00JwTwD8=;
        b=wK2HTsGRLGPS4htGIvor+3FSR6+XNwBaY+B4XMmkKJ4hNa6oL/g0fmiP6X1zw4P0XV
         utpT8YOQNVuLS2tA0uwsKn4NMlS+0RgOSpUllJ6eREvca24YhMVEiEztqS0Ywy75HZst
         XBoSyNPjuAg+C5GJ3Y75UmQoI/UdYl22Z1CTExcA0WbXUbO+VksfzBkQZb53Z3SPXWgM
         585UZByQKRTe6pDXnwFIDtjmBPvmq5pJWbY0eO1N0Pb3eaMoAUpMV8kdvZ+lhC0C//Tb
         4LYHEy4+Wmk5q7scaKX+X8+gAmNAAJ1BI4jYsXTfmJGFRaxzHmSgtz1inqtEZbJSlM6b
         Xxag==
X-Forwarded-Encrypted: i=1; AJvYcCW0elQ07kmvZ/+bMp2bMqa6yjh+tH9rJu3iE0gy9fY+zeSeqZKF0PJfY4E3Te15dC/awfMAPvqPfay2EarKaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIIM4xONFsNwIQR94Df60QMHOIHbO04kjnjTvsQBV958ixuS10
	dv4Y6t5u+9dm/akyDQP0yCOV2IE3T5y9zOzgVcAzCmo+tex3Xj2Wyo5EcVVAC8ELGxrHDRjUHKh
	u6fEbXGZA3RfZFtJxhP6V28DW6Bx2KCvP6GXmPa7sDmwnQdhqM71FZ1WkTmE7OZ3LpIJX+g==
X-Gm-Gg: ATEYQzzTbPcgBX/ekNT2hel2saoPACgr8j+ZRoRlUxRTphbONKz8CJr4ajM83732dXv
	TFgaCImD2AVfrVwKkFnSSecdru21ga6qQRHQaAQwSDQr1rlx5v5/UDwptciKK6znfCNqJL+ZIhm
	rtqxgkX5FwpE/NdaqK+X7LEUlliwqP1cZZn+5MhxfLc0xtdPoneA0TuW0vNSxDoOSaxYmqi1mKx
	ECJIwO4FDNNWtL27baKj08PDIeibQFi2GFxShs8aL3cZucrcnz8FRydbT9PqjJ2aafhrBlPu58K
	TGXXJkEBYuTzh3w70E06761+ldsPK+pS/uGkXVXFRuP7YGqgpXOq+OAWYkfzqqoGSqUeZ/GYBwV
	Cs5sznqy27GNaQWZ0bjeCRSs35235U67biqdg87WFmdL23yf9mSvgU69n
X-Received: by 2002:a05:620a:d84:b0:8cb:8251:3fe0 with SMTP id af79cd13be357-8cb8c9fcffamr2410023285a.24.1772114019384;
        Thu, 26 Feb 2026 05:53:39 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8cb:8251:3fe0 with SMTP id af79cd13be357-8cb8c9fcffamr2410019585a.24.1772114018887;
        Thu, 26 Feb 2026 05:53:38 -0800 (PST)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac73a5dsm58334366b.25.2026.02.26.05.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:53:38 -0800 (PST)
Date: Thu, 26 Feb 2026 14:53:37 +0100
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Alex Bennee <alex.bennee@linaro.org>,
        Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Message-ID: <rlqvriokmytc7etiayw6chxbti4nhjxy4gkhdf5bkftw42yfgm@lsl7ekuxe3il>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <k6a7me4yaf372lllkyy3hgm2rsjxtzbmyptqp3ebko7z7znah2@3zwgt46i3nbo>
 <C3D17D89-EBE8-490D-9A2C-09641C7125CE@arm.com>
 <c2722ggmzqog6fgi63yiaxqzuwomivvkfzdcdwuty6emaxx4sr@4mwch42anuxg>
 <30A5EB8C-AE4E-4355-B819-AE22CA2CF881@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30A5EB8C-AE4E-4355-B819-AE22CA2CF881@arm.com>
X-Authority-Analysis: v=2.4 cv=QMtlhwLL c=1 sm=1 tr=0 ts=69a05064 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zj4Ww7-zeD44bKyykicA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bOL0s6vQPDYnODRIHaDLR-nwdF_5N_3w
X-Proofpoint-ORIG-GUID: bOL0s6vQPDYnODRIHaDLR-nwdF_5N_3w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEyNCBTYWx0ZWRfX/YbeMjvWoIru
 aYGp1JHKW85bmQRYtKH8UkEReoItjzDdb+AG0Bj5VCP2V4R59J3ulESP0JgxhyanYKS2b7u3dGT
 EQDFNZbac09r61jA+N6aNzYGbpJ5Vp4/a5EtD14SSSXSZZwH18TrO7vxrc/i96Ozrjf9ze7ByYV
 2upFJhr5JFV+M71gf1PcpyhmwHrZuN/aR7zE6LvF/AEiXYrPywWNU4+voVUJQZyZ849ArAwkHM+
 ZH9Vkbzx/QgGe7Rtc4JDSoTiEIlkuVWNeHrzaUt0+aFrnTeemwKSkElpVdV/l5eB8AG6pVGYeDn
 ZgD7An3EpUhiHjolFE2KBJp/vDyN2Imeg2iZxKKXBOrzmgXU+Ahqv58gw37gjE5G/peYg8itk6i
 gck6U+dTgdkD3VBADhee9iAiNEr/pU/XSvUUdRAKveSLB5acPpwQRNu3sBOGFhoJzf4oVy+hOiX
 Bw/Sw044pY3LlPBytug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260124

On Fri, Feb 20, 2026 at 08:23:26AM +0000, Bertrand Marquis wrote:
> Hi Peter,
> 
> > On 12 Feb 2026, at 12:16, Peter Hilber
> > <peter.hilber@oss.qualcomm.com> wrote:
> >
> > On Tue, Feb 10, 2026 at 09:39:09AM +0000, Bertrand Marquis wrote:
> >> Hi Peter,
> >>
> >
> > Hi Bertrand,
> >
> > thank you for the fast response! I added replies where I think they are
> > relevant. I also added a few new comments.
> >
> > Best regards,
> >
> > Peter
> >
> >>> On 6 Feb 2026, at 17:28, Peter Hilber <peter.hilber@oss.qualcomm.com> wrote:
> >>>
> >>> On Mon, Jan 26, 2026 at 11:32:28AM -0500, Bill Mills wrote:

[...]

> >>>> +\busnormative{\paragraph}{Error Handling}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Bus}
> >>>> +\begin{itemize}
> >>>> +  \item A bus implementation MAY report a transport-visible failure (for
> >>>> +        example, after exhausting a bounded retry policy) when it cannot deliver
> >>>> +        a request or obtain a response.
> >>>> +  \item A bus implementation MUST treat malformed headers or unsupported
> >>>> +        \field{msg_id} values as invalid, MUST discard them without generating
> >>>> +        additional protocol traffic, and MAY log the condition for diagnostics.
> >
> > The bus does not have to understand transport messages, so does it have
> > to recognize all unsupported msg_id values?
> 
> Very true, i will need to fix the wording to state invalid bus msg ids, transport should
> discard invalid transport message IDs.
> 

I am also wondering why any "additional protocol traffic" is forbidden
for unsupported (bus or transport) requests.  Couldn't it be reasonable
to indicate an error so that the remote endpoint doesn't need to wait
for a response timeout?

> >
> >>>> +  \item A bus implementation MUST NOT generate error responses to event
> >>>> +        (one-way) messages.
> >>>> +\end{itemize}
> >>>> +
> >>>> +\devicenormative{\paragraph}{Error Handling}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Device}
> >>>> +\begin{itemize}
> >>>> +  \item A device receiving a malformed or unsupported transport message MUST
> >>>> +        discard it without producing further protocol traffic.
> >>>> +  \item Recovery actions taken in response to an error (such as retries,
> >>>> +        selective resets, or device removal) MUST follow the normative reset and
> >>>> +        status semantics defined in
> >>>> +        \ref{sec:Virtio Transport Options / Virtio Over Messages / Device Operation}.
> >>>> +\end{itemize}
> >>>> +
> >>>> +This specification does not define a dedicated error-reporting message; it only
> >>>> +permits implementations to surface failures when silent recovery is not
> >>>> +feasible.
> >>>> +

[...]

> >>>> +\msgdef{GET_DEVICE_FEATURES}
> >>>> +
> >>>> +Drivers retrieve device feature bits in 32-bit blocks via
> >>>> +\msgref{GET_DEVICE_FEATURES}; the response echoes the requested block index and
> >>>> +returns one or more 32-bit values with the feature bits in that range.
> >>>
> >>> I do not understand the purpose of echoing request values. Looking at
> >>> virtqueue messages, the driver keeps track of its outstanding requests
> >>> internally and looks them up upon receiving the response. Doesn't a
> >>> virtio-msg transport also keep track internally? What advantage has
> >>> echoing?
> >>
> >> We only echo the index in the response (there is no data in the request).
> >> The idea here is to allow asynchronous requests/response and provide
> >> an easy way to identify the content of the data in the response.
> >
> > I would have thought that it is simpler and more robust if
> > implementations would refer to the token to identify which request is
> > being responded to (instead of possibly taking the response echoes at
> > face value). Implementations might even have at most one outstanding
> > request at a time.
> 
> We want to be future proof so that this is possible in the future.
> If tokens are purely handled by the bus, having all information might be
> easier for the transport.
> 

I still feel uneasy, since I think the context of a response would be
available locally easily and in a more robust manner (e.g. if the same
request is issued repeatedly).

The bus preserves the (per-device) request-response order anyway.  So
couldn't the bus layer point out the association of responses to
requests to the transport (as needed, e.g. through a pointer submitted
by the transport alongside the request)?  Also, omitting the echoes
would shrink the response size (with message sizes being a concern
AFAIU).

> >>>> +\msgdef{SET_DEVICE_STATUS}
> >>>> +
> >>>> +\msgref{SET_DEVICE_STATUS} writes a new device status value. Drivers use it to
> >>>> +progress through the virtio-defined states or to request a reset by writing 0.
> >>>> +The device responds with its resulting status, which may differ (for example,
> >>>> +if it refuses FEATURES\_OK or sets DEVICE\_NEEDS\_RESET).
> >>>> +
> >>>> +\begin{lstlisting}
> >>>> +struct virtio_msg_set_device_status_req {
> >>>> +        le32 status; /* desired device status value */
> >>>> +};
> >>>> +
> >>>> +struct virtio_msg_set_device_status_resp {
> >>>> +        le32 status; /* resulting device status */
> >>>> +};
> >>>> +\end{lstlisting}
> >>>> +
> >>>> +\drivernormative{\paragraph}{SET\_DEVICE\_STATUS}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Driver}
> >>>> +\begin{itemize}
> >>>> +  \item A driver MUST write 0 via \msgref{SET_DEVICE_STATUS} to request a device
> >>>> +        reset and MUST re-read the status (e.g., via \msgref{GET_DEVICE_STATUS})
> >>>> +        if it needs to confirm acceptance.
> >
> > SET_DEVICE_STATUS already responds with the resulting device status.
> > Why would re-reading the status be necessary?
> 
> We identified some cases in which a reset cannot be handled atomically hence the need to have a way to confirm or wait until reset is finished.

I think this should be rephrased to explicitly indicate that the driver
must wait until it observes the device status change.

As of now, it could be interpreted to mean that the driver just needs to
confirm that a status change did not fail by re-reading once.

Best regards,

Peter
