Return-Path: <virtio-comment-return-5666-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6AC77B60
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 21:12:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 180732AEDD
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 21:12:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1D2B98664C
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 21:12:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD3A89862A9; Wed, 26 Apr 2023 21:12:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C54FB986641;
	Wed, 26 Apr 2023 21:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0r/VlgnIx4Is56xMjIrXWxyd4iblqeShf7b8cg0/dD1lTiy40o/BpfVN24j1wGCUA4f05YR2gnQ9fvdphugmPohnNcvk1Z2bsXXYUSXJvVNoko2eCBV/q4vW7IVGb+lmq4gFwSky6dEvHvuEyO1Y8CHV+po/2F8f5pYjKn3eWv/XuIVwP7ooPXtyLPFjBD9ZBhF6nTmWau40yAKCuyUZpZSq8yeKFUP//TaY14oGLL8GaUeqdaBYrLaV72tzHjG3/0C1OeemU65WsitCKoxnD71lihRSLDl+55+Lz3dzSL9Sx2tbimPK7nA7ZjJ9xrAkNTMeSQ9H1ERFkJV6xVbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAgPZA0FouE1/oGQWUtKMy/AwpiiEGMGhXPHL7Qg0tg=;
 b=js6SA6wsoDESwjD4PORDr7ceMHZRkv12dwpMlU84AWwXia5j76imhx4/qb3m/HtwPNnbO4QldxR8Fkcv/c97mSXePRfqADetrO0lzncakYspgMsdSx5I2/Qrjzl0kyOIedyTF3SXbItyVP/0sJPFy7zuuOPXokFpLSZtuhe3MD12Gns6w0ZAXnn8qB+CqcuAjTNEti1kLZo1+x2lcEbXWFeUkfbiCALDjLetp2laGT5qeDJGPSub8RRhGXg9wYR+cteLLKhk/0nJBJTErGU18N8VmWhNkm4SUHr2R7u6+GvixFNnLPlCAwjZkQFZKyGOFSNr7KfqcFSKcLPM2N4O1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <5cb79b37-a066-283c-eee7-afd26146d988@nvidia.com>
Date: Thu, 27 Apr 2023 00:12:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
 hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>
References: <cover.1682354275.git.mst@redhat.com>
 <8a3435860747eeaa038ece4ff896c1cdd441c185.1682354275.git.mst@redhat.com>
 <5858e2e6-0b50-c155-85e9-eea6dfb533e1@nvidia.com>
 <a4b1596c-2132-714a-7557-fa5249a55945@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <a4b1596c-2132-714a-7557-fa5249a55945@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e07064-5173-4bc4-0401-08db469af1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WADiBgWvEx7bux1jbZj+3bQnJjQEV/44guFq/tmX38uoiJygxgxyxLxUf3VKYzjaGj5donRJngJzLdEWvc6jAJ9wPp9k9zwmlwq8jitczzMVfIlSLusApiHHaphh7LjLsHNFax+GjRyaEGqbMsFg0kNYQjSxxJ0Bg+V44xutNADE+Fxrwwz9vwyGY00s2W35kJsUX5bfmJ8MT6mcXvG45Gq8CN50+k6FNDSDbwQ4V4GmUTxMXSdwIZfIdbCmQaFCN+i/cbG9+wQkCs+te7SdNpkcxPrHj7knAL+L2SMyYW09pwHwYZmlQrk7gjGeJoI++KFO8SV/MXxG5knxxLo0LFdddOppgP1rxbRu7FDxmczsiBZ9hMdFjRHw3U+ryPK2pD6ks7mAh/NODZ3ZW7h8p041uFoxyNFYcRgBJ31sM6H0RSgUxiF+rByhxuEpgzYoe0kaAP4XPVpO7TxREYiVkkN6Ku155xnu9IipHyDB5xO8u23w35humFkWixLjDX03+wKVRbMdfM9EUsoYGWWLXF1tZvSaZYBsXK7dFfmHxpLnIThCs4LunaI+/k2gfxGidXGYLjQaBduyV4osFEiI612QifreNrYIOCU8OxK2Xy8PNRDU3GUGs92THGxih7IZoorz1rzH3K0UFWX28W8100Wv2T75/eS/TFc87UY+gkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(31696002)(110136005)(54906003)(86362001)(36756003)(107886003)(6486002)(186003)(53546011)(26005)(6506007)(6512007)(316002)(6666004)(66476007)(66556008)(83380400001)(66946007)(4326008)(2906002)(41300700001)(921005)(38100700002)(8676002)(31686004)(8936002)(5660300002)(2616005)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzFZeHArY3c2a0FCR0dSSzNWVHBUQm1JOWNGRkJzd1JISS9lL0U4ZUdYUkYx?=
 =?utf-8?B?eENTYUhhaWZhUlhaWEcwaFBWckdXZzROZ1RiMlB4MlluUmRqeW5oOUd4MUxT?=
 =?utf-8?B?NnJ6WGxja3VnV0VyMTJ6am9NMy9RREJRTGVRbjIrY3VHcEd6VEZLcVVyaFJU?=
 =?utf-8?B?eUFDMS9ZMVViODZrbUFDbWJJZ1ZvTUM1WFIxanlCbVFqRmhGTjZmZXh0c3dJ?=
 =?utf-8?B?THl5cWhqenBJY1MvRmZCbkszZjY0dzNXRGhPVFBuckdIS3FweTN5dm9FWkpV?=
 =?utf-8?B?OFRwaTh4SVBDTllkQVpBNDJKWmZiRGdKWThUZ0s3dHF3S2hYUG1hakxFWFll?=
 =?utf-8?B?R0hITEpsVDBpS3FyOE41dmZ0MUJRSzNFS2JGMzBkcU02eGRqdGl4ZTU3Q2xv?=
 =?utf-8?B?dk9ZOEVmN1MraE9jajNxalEvOHE5Q29TYnFLcnp6U1Q2ZEVabmZvQzV2RkYy?=
 =?utf-8?B?MU83Snl0eGs2cjdTZ0J0S09yTjgvUmV1QzFqK2NsTVpFekh4TUsxU04wZ3NU?=
 =?utf-8?B?T1FFZWIvY0pFZkJvcGZSOU5NaVQ1c0U5TENqZ0lVQXk0QlFwRk9md3BuL0hM?=
 =?utf-8?B?cEtza2xjTXJQeW5ZL3plWE5TTTFmU1hUVWZNWk14ZExpRWprMGJ1ZWk5MnlS?=
 =?utf-8?B?UzB4R2Z2cDVVbDJZbGI4Mm9ZU2hmSEU5VTlDaFJjUFl3Z2FRTDhRMXZsOERi?=
 =?utf-8?B?VHdiZERSZXJ5NmptbHp2WGRvL3RUTXpjN25JZ0xLS0FBd2hhZjB0UWl1dHY2?=
 =?utf-8?B?ZmpiMlZBT3lMZ1VKdkxoWlQ3dlNhUStlZ2txejFYVUpIOHRKazFHa3FCK1hO?=
 =?utf-8?B?M25WOXd4WE5nTXVUSzVvc0ZRZkhheEhhQkl3QnordXA0aVdYeEs4N2hJZHRt?=
 =?utf-8?B?UWVRRUdONThISUcwdkVrbUFQSXUzbTE0cTNKVmVCU1MrdGd0Qzc3d2NNeTcx?=
 =?utf-8?B?QlphK2I3UUFicEtid2I4MW9nb2FrWWIxMXpBV2kwN1EzZnpod2dhWG9JR0JV?=
 =?utf-8?B?TmsvekhwRzdDWXBhZGx6WGc0WDFPQmRHMUxwcnFUcCtUQldMVXQwRU1VZTBW?=
 =?utf-8?B?OEd3cEx1TDJibzBOYytQQjB1ZEhUb2ZTK2I1akFVeXNpYlhWRHhlV2hocmo5?=
 =?utf-8?B?azhxak41eWFPd2poZDNsdHpzSDNaOS80b0hIa1ZxQ0JBc1ptTDRUS2JhanZo?=
 =?utf-8?B?czdjSFFLdG5SR3FOcFhLRHpKZWVTZFZLUGMyV240MUplZUtIbzBabnR4cFRa?=
 =?utf-8?B?RFVNd3lTM2h2RnBFSTRmYWFhYzRxSkNkbkVYRGNvMkRIdXd1cmJXL1QwbVMy?=
 =?utf-8?B?clRqMGhMQTlsREhFQ0dmSFp4NmhFR0ZuRjZKb1NNN0l5NnRpajdsOGdFd09p?=
 =?utf-8?B?NHBLRXJyS0xlQ0VjMmxKWVpVTU1vMzNOM05nK3gzUW1WRFh5SmVqaHlEci9p?=
 =?utf-8?B?NUUxc21QOXhjSHZVVEhEcysxSyt5UndrTlFEMEt1eElsNTA4eGljMnRxK21H?=
 =?utf-8?B?TVNsVTNUK0hWMk10SkJWa2J2c2l2WlFwMWE0c2lsSEl2VUdkaTNlVWdVZktv?=
 =?utf-8?B?cHdVcDlyNjN4VlZnSitVb3RlZHA5b1lpRWE1VitzQ0V0ZkIwaGkyczl1MEdJ?=
 =?utf-8?B?bnEzVUpLeWpOOGdPbzY3MmhaMFlCbDdOb2ZpYVpmcURaQmtRNzUyLzZidU4w?=
 =?utf-8?B?dkV2SksvcGZ2WVY1V3JpVWs1TDVUNEJWL0c3SWtRT1hXMmQ5WGhvNERjVjlR?=
 =?utf-8?B?bTVrT0x5a3Y4QnQvcHYwRnhKZmh6cXhYS2NVOGt2Zmp1L2grSWlsVlJvR3Zy?=
 =?utf-8?B?Y3IyY1pIM2V0bEJsZmtNNHE5OFlSdW5NdllPLzQwTDYySnQyamdLVmJyNlRq?=
 =?utf-8?B?UFJDcFVEbTRkdExkSFpvTG5ZalNVbUc4T25MNmNrVTFjY2xTK2FqRHlHcGs1?=
 =?utf-8?B?bUZ2REtqbURFSkZXcUpQTkZLZUtIV3FSNjZzb0s3dHBFZXBUUGF4R0V3bWZ1?=
 =?utf-8?B?N3p5MUhQNG00b2VGb052cVR4bzVFb2ZRTzYwMjVuQUF4cjFVQlF2d21QdjNs?=
 =?utf-8?B?UXh1NTVSQzhKRFpWeGZNOWswbUFCdVJURnhnazQ5UlliblFBMlBSM2VjVlda?=
 =?utf-8?Q?GGSCyve86tGYKP1D0rSJw+1xu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e07064-5173-4bc4-0401-08db469af1c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 21:12:30.1871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imZlgaYa8MhaXhE/XSD/rr9FnOexrKbABhrfqs5ZcuAfDbL6Ve18UV1a7IwPB7gaBidFCpB+ThTCJTXCDEFtQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602
Subject: [virtio-comment] Re: [PATCH v12 05/10] pci: add admin vq registers to virtio over pci



On 25/04/2023 1:14, Parav Pandit wrote:
> 
> 
> On 4/24/2023 6:06 PM, Max Gurtovoy wrote:
> 
>>> +If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
>>> +configures any administration virtqueues, the driver MUST
>>> +configure the administration virtqueues using the index
>>> +in the range \field{admin_queue_index} to
>>> +\field{admin_queue_index} + \field{admin_queue_num} - 1 inclusive.
>>> +The driver MAY configure less administration virtqueues than
>>> +supported by the device.
>>
>> we need to say something about other virtq's indexes.
>> For example, if aq index = 0 then for the vblk device the request 
>> queues would start from index = 1.
>>
>> can we address this ?
> 
> It may slightly complicate the device implementation when device 
> dynamically changes the VQ indices based on the negotiation of the 
> feature bit.
> Also the drivers with and without need a different VQ index handling.
> 
> I am thinking that aq index should not overlap with the vq index in 
> range exposed by num_queues field.
> 
> This also aligns to the exclusion of aq count from num_queues field.

The namespace of the aq and other vq index is the same.
And the configuration is done using the same queue_select and other 
registers.
Thus, we need to address the above comment otherwise all the device 
virtqueues chapters are wrong.

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

