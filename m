Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745433559C9
	for <virtio-comment@lists.linux.dev>; Tue, 18 Nov 2025 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469436; cv=none; b=r87r7Ry2ThU/ABZBc2Ky/zKU8wsxFMskZEyuExuH4am6+tsGv99dhLg8cM6y3ipxdm3oZr8UG9w/tfvTEmo11B3uLcKBWbJmZXgL8gzaSIUHj7G3V4mEFDaEwGGAoIuBH3NecG0S1b6HlTUYPtukDRewJ945bKRW1mZIfgtHkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469436; c=relaxed/simple;
	bh=qaWWQN6CI6aafph7LivVoBPJrcnm9RDyjg227LqBMic=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=f/iPvAfpR0emRb9rKJVdtjC38Abfo+OtSXS9Y9gkS3GozYakx93Q5D76MxUqT5gaNJURdxlGaO2IPD1jiJttowj6xgKhBhNCcixNvZHpQ2IJpAWvPsGJ7OaZzDlR70xPEW8qfwMWVKwDzDB+CnyE93Yudyga6Sgw15gxtKrMABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5c4Z6gG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcbysNCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5c4Z6gG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcbysNCA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIASm0L375942
	for <virtio-comment@lists.linux.dev>; Tue, 18 Nov 2025 12:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVM9IBG/fBElbt2GwxU0Qe3v10MMSITkilTfX/CByEM=; b=O5c4Z6gGOmSAoHyI
	Ik9AGduoGZvjfpG7n7HrzxDabpf4T3cyeRkO4QYHy9jwpOT3uaXWJYaXsnwIkLIo
	1Q+NUNNiPmDeBJSoZMFu2soyeE75aIygQLGv4QoaeqEW1KRPlJk7Z5t0qyS8BPFd
	4afz0KS3StuUKadaMA8HiQZo/CqpPcEkQmiFVDK82fExVagphaMV+JhuFu2os/RW
	Mjw7Yt5lIjFjTmWyjDL6pRQmb634UPWu1rCr93uDusiUMAlrZmXUPEFfsWuCOYkv
	mMc6ngHBgx9867cUyNp12eZzdeCHqdmloMizt0pYbFuZMhG9NCxx7aAp4RuO5H33
	lTbQtg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nk47d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 18 Nov 2025 12:37:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso160418671cf.0
        for <virtio-comment@lists.linux.dev>; Tue, 18 Nov 2025 04:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763469432; x=1764074232; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EVM9IBG/fBElbt2GwxU0Qe3v10MMSITkilTfX/CByEM=;
        b=RcbysNCAhQ6GqFDMQ72JvCVIGCpxkTzwMW2Wtlr94bbaQvmR93DuXlyoOji9ni8m8l
         tafNLA12wKkEwedSJZMyvhjAwobaHk1mEdD+53uZb/Gq3XRqdNllDxkz1Vd6e1qdXIWt
         bKCMNAX8yySyjmFl0/aoBgZJ9DLFbNaL7u173I0Z0fstpMr2j8glSrnOrgrR3d8YKeKh
         owggIa9Xg56dBkyRFDI8wuJENo4s4P+PMk6vW4CSL1enCYGiaqexrdUVRAApDFPqsfQf
         mqZEdIbQ6Qt+DqCK6ClUJQOPUe43es2zIxpBH/amDV/zi1xeGxL+zKuAD1l76tn0G4Nt
         fBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469432; x=1764074232;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVM9IBG/fBElbt2GwxU0Qe3v10MMSITkilTfX/CByEM=;
        b=LA3oiDBl2/13/r80rZkgUrpHAfRRPdKHwdAXAqJtCxBUqtoKl9AdfiaP1pX0+EAdnm
         JPjD9NtFoUIl4MhOM989qP9N63mvJDOnw1KSzxvMkF1BVYOYZhEWMuF4uS9vNC3FcORr
         slwIl/ZSDG3Jp6Ueio4KGPwTemPVTx8g9OZgkJiq5v+jEQYV/xQl/vqWbs3UOsfV32p0
         w4Vx9JFu6KwWGtsMLNJ64rWhT2YNt0PRCUsDE6TzrqcIM44tS+8llp+8eT+Wh+40ON53
         1SOsIKPb7EsQy+DGKIX9/T/w2S/CgDw/Ewi0BWbmielwAQYiU0V/qbxaRTERR5yePzq8
         wA2A==
X-Gm-Message-State: AOJu0Yx+E2WgIkQFDW82Co1i5bUlyByRAR7rViswIs3y+A/v86YCRWSM
	gVIvrbEOMQFC8EYEVcX9mkbdUkABMFB0bQ0oW49MZhwRRVyC3+BBiU1/FTiEuhxPb4nR+T3fIi8
	mJEc2qB9MVdTujSpptEok17z44yDfHEpuNGXT32k+2FpR7U5zhDDVX9VMCRcllESE/1Un38wbfw
	to
X-Gm-Gg: ASbGncusmKL2Qx6SJlO3fwxdphtBo9v8dxkOymLn/U+uH+QD/jtWWil59sG98Tvu9/1
	oH24EduzUW9Gu1ghu1EtmZvbeWDFgZ5qJ5fBj39W5soYicdCu+ckh74NqGqv58BwiKvNN/h+hM1
	WBaBpKSWbkHX14H/x3kCS2yBPdWpJOPVqAsMnTKF3MR0Vlnp8+uWo1+cu8MJFoiP6+uK0LJlk9u
	ZpI9Fj48w51dCdyC5du9Khl27lCz0SejKxTySc4qVMdhegauPBEx/zJZvE40+3rAW0x+gxoFtrf
	tmOAAGXLBVUWEz4fUw/1n/SE/QF2mqyTwVYi/l5bSfvxs0PYk+f7iyq94TZBbELyQzGPgcrsdgD
	tWy9uVdi4metro7uayuESQZZYHAKUC/Hc
X-Received: by 2002:a05:622a:513:b0:4ed:dab1:8109 with SMTP id d75a77b69052e-4edf203d183mr193920291cf.17.1763469432307;
        Tue, 18 Nov 2025 04:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0nMoSGm4xyQxZ0Yt6g8r88nuNPc8PmYV5nmD6ztvUKtH+NMtGCdZblvAepDYrxJI4x5NZyQ==
X-Received: by 2002:a05:622a:513:b0:4ed:dab1:8109 with SMTP id d75a77b69052e-4edf203d183mr193920011cf.17.1763469431772;
        Tue, 18 Nov 2025 04:37:11 -0800 (PST)
Received: from [10.224.242.57] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d7ddcsm12603012a12.1.2025.11.18.04.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:37:11 -0800 (PST)
Message-ID: <c976d5a6-4091-4653-8a1e-55d6b7b7a2ff@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:37:10 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] content: Reserve ID 50 for video encoder/decoder device
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, tsoni@quicinc.com,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
References: <20251027203356.3301-1-alexander.gordeev@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251027203356.3301-1-alexander.gordeev@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMSBTYWx0ZWRfXzJRbToKfopOV
 K5cNuinRBlIw972SoOyhNeeNQa7sVw2jbuDWCNchfPEWoRNd5cQcm1ZlhiTexCG4OE5GmP0Uw/9
 RyZSzZ5a1i+K9FLGKscndSzfs5IXkvdofqWBL60zv74Kp316heJdwQnRZRkQ46z64vNpCt/uKpc
 4ekgz0qayfcCgUHZILeQ05UGG8IwVeho9qiNEnp0sjC3Yjqho8FpF8a0xOB2lhsrpHKHzNvUbtw
 nm6k44k+zqqoG2+mGmCS9pGJvWjynIlnw6egbC3vxjw3IWXUgDIW13DXMiS103bDRZzoCVcAcHZ
 GTz5VCcgVwkkKADWJpe5dbekCYwa+pX14Z3h3oCwUBXeBKi+OtaHmlm9Rbw3TS2IV5/WFxNhLyn
 Bl2SlVwTOJ5j0D6W8ECLJhgD9iMgZw==
X-Proofpoint-GUID: m-AAP2-mpmlGCBMKPYLQmLhpNH85jzQ-
X-Proofpoint-ORIG-GUID: m-AAP2-mpmlGCBMKPYLQmLhpNH85jzQ-
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c6878 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=t2cYH5rhmJ0nFtvfD0EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180101

On 27/10/2025 21:33, Alexander Gordeev wrote:
> Virtio video encoder/decoder device provides a stateful API for video
> encoding and decoding.
> 
> IDs 30 and 31 are already reserved for devices providing only one of
> the two functions. There are use-cases for a device providing both
> functions, so a new ID is reserved after a discussion on the ML ([1]).
> 
> [1] https://lore.kernel.org/virtio-comment/20241223055543-mutt-send-email-mst@kernel.org/
> 
> Signed-off-by: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 5de811f..243ce2d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -803,6 +803,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  49         &   USB controller \\
>  \hline
> +50         &   Video encoder/decoder device \\
> +\hline
>  \end{longtable}
>  
>  Some of the devices above are unspecified by this document,

Thanks for the reviews!
Could we please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/235

