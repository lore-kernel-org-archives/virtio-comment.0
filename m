Return-Path: <virtio-comment-return-8704-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB70C4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:36:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9C0212B01F
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:36:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7B6CC98687B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:36:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6318898614B; Fri,  1 Dec 2023 05:36:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 52C8298669A;
	Fri,  1 Dec 2023 05:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
Message-ID: <bd50a1e1-75ab-41c3-9fdd-9cfbeb13034e@quicinc.com>
Date: Fri, 1 Dec 2023 13:35:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <virtio-dev@lists.oasis-open.org>, <virtio-comment@lists.oasis-open.org>,
        <cohuck@redhat.com>, <harald.mommer@opensynergy.com>,
        <broonie@kernel.org>, <qiang4.zhang@linux.intel.com>,
        <quic_ztu@quicinc.com>
References: <20231130092242.17303-1-quic_haixcui@quicinc.com>
 <20231130092242.17303-3-quic_haixcui@quicinc.com>
 <20231130111900.ix3cfsxlns2blp4r@vireshk-i7>
 <b26382c1-6601-44b8-8376-3f96d605f2d5@quicinc.com>
 <20231201043203.7ozpnk2k3dci4pq4@vireshk-i7>
From: Haixu Cui <quic_haixcui@quicinc.com>
In-Reply-To: <20231201043203.7ozpnk2k3dci4pq4@vireshk-i7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OhhobNkruS0luUUNrxAHFAyS_XCz1JiR
X-Proofpoint-GUID: OhhobNkruS0luUUNrxAHFAyS_XCz1JiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_02,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=661 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010032
Subject: [virtio-comment] Re: [virtio-dev] [PATCH V6 2/2] virtio-spi: add the device
 specification



On 12/1/2023 12:32 PM, Viresh Kumar wrote:
> On 01-12-23, 12:05, Haixu Cui wrote:
>> Looks good. Will update as follows:
>>
>> \field{tx_nbits_supported} and \field{rx_nbits_supported} indicate the
>> different n-bit transfer modes supported by the device, for writing and
>> reading respectively. SINGLE is always supported. A set bit here indicates
>> that the corresponding n-bit transfer is supported, otherwise not:
>>          bit 0: DUAL;
>>          bit 1: QUAD;
>>          bit 2: OCTAL;
>>          other bits are reserved and must be set as 0 by the device.
>>
>> Note: Transfer bit options are commonly used in SPI:
> 
> Maybe:
> 
> Note: The commonly used SPI transfer modes are:
> 
Hi Viresh,

     SPI transfer modes here may cause misunderstanding, in Wikipedia, 
SPI mode is the combinations of clock polarity and clock phases:

 
https://en.wikipedia.org/w/index.php?title=Serial_Peripheral_Interface&action=edit&section=4

     What about updating as: "Note: The commonly used SPI n-bit transfer 
options are:"

Thanks & BR
Haixu Cui

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

