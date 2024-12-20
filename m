Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695B218EA6
	for <virtio-comment@lists.linux.dev>; Fri, 20 Dec 2024 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713238; cv=none; b=cGpWITQKgyA8RIffT+nJdFBUb+Diz2U9+jrOV776an7wuC/8EJL4mpRetyvmuirTBbQbnRtvE/oi9EHdOxIEo8/Tu/F6i4zBxpGqdfC2mX31vA6/hu3+90G9xx2HAdj6gsIEjjt+JHbsvH2dWz49bOVU7yzBLeFesHLcIvuoO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713238; c=relaxed/simple;
	bh=RA5mJAbJA22zKRuLXxqq0m2hx6mRu/IRTKQk/M3kaHM=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=n9XszlWwRp0C6T30VdieLMf35GI3pfMc5lNLvtonDlEAdSS+Oc9U2vutIjc0kqtyoVGlPrhz6YoTYexLLUHm8UTk18JjVDWgZc8ERFfy/zYd8Ma8rCHDpMFzgyAyFurTsToJI9iX5ERP4RbZV6rl5YBgKBIZXhE5QEauGizyDDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PapmedM1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PapmedM1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKD3pOa019560
	for <virtio-comment@lists.linux.dev>; Fri, 20 Dec 2024 16:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RA5mJAbJA22zKRuLXxqq0m
	2hx6mRu/IRTKQk/M3kaHM=; b=PapmedM18ed7P8Sk4MltMfraqWid4xI2a9FSRK
	czawLAKaU0VMudzEwG0aevZLnRqZpACrL6d64BZEVR5ngeF8qDfXRAV9X2NNvXHa
	3VVu8CvTgHfWW6jjOo0hT11HszcULnc5M57x7+nOcgJrGYp+EixeNEWgozcwUOHv
	bLUWAqkZxkAANsVpDjpnsUoDaoshdIPnclcHS37KRBCZjKb/D29yuzEO6FvSWcep
	d+umwM6AS8I+8ZWiSwDTZxkKSs5Iown9zLxLOoOQS3ZRkyrdbzUbzXHfCarHv0rV
	xGxcozBE5ioUvt2HXSjLq18k8HC+RvXbXErTsud6KrNwSBKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n94tgk1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 20 Dec 2024 16:47:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKGlEGX009280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 20 Dec 2024 16:47:14 GMT
Received: from [10.111.132.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 08:47:12 -0800
Message-ID: <bbef01ea-2085-49a8-bc6a-76cf66a6183d@quicinc.com>
Date: Fri, 20 Dec 2024 17:47:11 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <virtio-comment@lists.linux.dev>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>
From: Alexander Gordeev <quic_agordeev@quicinc.com>
Subject: virtio-video device IDs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JBn1RWmXBccT6t-f57q-_GXO9YrG-Ka_
X-Proofpoint-ORIG-GUID: JBn1RWmXBccT6t-f57q-_GXO9YrG-Ka_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=615 phishscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200134

Hi,

Currently there are two device IDs assigned for the future virtio video device:
 * 30 for the encoder
 * 31 for the decoder
I received feedback from our internal reviewers that in some cases it would be better to use as few virtqueues as possible. So if a single piece of HW supports both encoder and decoder functions, then it is better to have a single virtual device, that provides both functions as well. The specific function can be selected per stream then.
Is it OK to make changes to the reserved IDs?
Are there any other concerns?

Thanks
