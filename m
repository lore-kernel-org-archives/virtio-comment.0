Return-Path: <virtio-comment-return-5263-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B94C76188
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 13:03:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 110F72B068
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 13:03:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 07D8A9865BD
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 13:03:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F1B7E9865AA; Wed,  5 Apr 2023 13:03:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E08339865A8;
	Wed,  5 Apr 2023 13:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
Message-ID: <ad19f1a6-bdcd-1e4d-1450-7292c8e4d1d4@linux.ibm.com>
Date: Wed, 5 Apr 2023 15:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Wen Gu <guwen@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtio-comment@lists.oasis-open.org, hans@linux.alibaba.com,
        herongguang@linux.alibaba.com, zmlcc@linux.alibaba.com,
        dust.li@linux.alibaba.com, tonylu@linux.alibaba.com,
        zhenzao@linux.alibaba.com, helinguo@linux.alibaba.com,
        gerry@linux.alibaba.com, cohuck@redhat.com, jasowang@redhat.com,
        Jan Kiszka <jan.kiszka@siemens.com>, kgraul@linux.ibm.com,
        wenjia@linux.ibm.com, jaka@linux.ibm.com, hca@linux.ibm.com,
        twinkler@linux.ibm.com, raspl@linux.ibm.com,
        virtio-dev@lists.oasis-open.org
References: <20230209033056.96657-1-xuanzhuo@linux.alibaba.com>
 <20230209033056.96657-2-xuanzhuo@linux.alibaba.com>
 <20230323154656.7f036d52.pasic@linux.ibm.com>
 <ff9b28a1-e0ee-f082-1f40-f3e149c9403e@linux.alibaba.com>
 <7a9ebec0-5e87-b80f-4f2c-c4db7ae4fe84@linux.ibm.com>
 <20230405084632-mutt-send-email-mst@kernel.org>
From: Alexandra Winter <wintera@linux.ibm.com>
In-Reply-To: <20230405084632-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uxG36jejcgKLlkydCfUkJ8lGDwQgsUdo
X-Proofpoint-GUID: zm_Un8BmiS9QYkFdCSAjQZkY9P1HHj8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_08,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304050118
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] [PATCH v3 1/1] virtio-ism:
 introduce new device virtio-ism



On 05.04.23 14:52, Michael S. Tsirkin wrote:
> On Wed, Apr 05, 2023 at 02:39:53PM +0200, Alexandra Winter wrote:
>>
>>
>> On 24.03.23 05:03, Wen Gu wrote:
>>>
>>>
>>> On 2023/3/23 22:46, Halil Pasic wrote:
>>>
>>>> On Thu,  9 Feb 2023 11:30:56 +0800
>>>> Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>>>>
>>
>> ...
>>
>>>
>>>> To get back to the things proposed here: the cdid is IMHO
>>>> a nice thing, and is functionally corresponding to the
>>>> (S)EID. But it is 16 byte wide, and I have no idea how
>>>> is it supposed to be used in the CLC handshake.
>>>>
>>>
>>> CLC handshake carry one SEID for all the SMC-D device. Considering
>>> coexistence with ISM, I am not sure whether we can change or increase
>>> the SEID.. cc Alexandra
>>>
>>> Thanks!
>>> Wen Gu
>>
>> As mentioned by others, discussions are ongoing.
>> It would be great, if we can agree on a way to use the existing CLC handshake
>> for SMC-D via virtio-ism and ism-loopback.
>> In that case SEID needs to be unique per hardware instance, cannot be increased and
>> can only be changed for x86 in a non-colliding way.
>>
>> An alternative would be to define new a SMC-D(?) protocol variant/version, where we
>> are free to define new fields (e.g. UUIDs).
>>
>> Alexandra
> 
> Problem with tying to hardware is that it is blocking
> migration (which is a challenge with ism anyway, but still).

Very true. My assumption is that _Internal_ Shared Memory
is limited to one instance of HW (as it is today).
So the 2 partners need to be on the same instance of HW.
So after migration of 1 partner, they should be able to detect
that internal SMC-D is no longer possible and switch to
SMC-R (remote) for the next connection.
(I have no idea how a connection could survive migration) 

> 
> 
>>>
>>>> If this is really supposed to work with SMC and not just take
>>>> inspiration from it, I would like some insight from our
>>>> SMC experts (they are already on copy).
>>>>
>>>> Regards,
>>>> Halil
>>>>
>>>> ---------------------------------------------------------------------
>>>> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
>>>> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> 

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

