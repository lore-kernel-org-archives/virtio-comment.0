Return-Path: <virtio-comment-return-8513-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6330CC61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F4E32AEE6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 73FA89868A6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4F715986890; Wed, 22 Nov 2023 02:31:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DD69986892
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 02:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOOOKXF9AXLkR3pvqA3yEUvn/JClfoqDvKIBVskdW/mnNqVqRhybNTbxu4ELZxYdmErqtizUq7n1s9JSXAMBwoH9ItddEpoXt3hk+2zFr//5MzGsHJXkE3fhFNWzbU3IC/w/VU+kjL2FVaHZqp1XOLHzfB6hrFmXVqPo9KIOjyJvbubxCvjxem13E6jpWJFcQhAbWftaqsjgZFBRj6NoXwrRxeWWYO1QYgtxDwhoCdle4+AM68gngTfZ5yeo/Lfl1E8kcO68p0I19NKXeC1ptDS11U5ix8DVigmEOU00IOcr9kTOO0q8mhey28ttgc5D3UJpX36ZYskoEODCqe48GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw/8XJZo3Q0GUhRcSBaf46wLO6aeZQ11zWnf2Pr3a8Q=;
 b=d8lE7RDLUfPePwrepP0Byn9w37yhxs5euo9B+EYDvLi3sPsdRWdfo2cYrjDuqQjuqGP5EdfLBAk7GhTf7asQMFgFmR9iD9q7QJCmE7KUXpVN7GWCiRvefL67MbqUPWWEmShWF4dNUGzr8iRREAgYMSroRZmaWFq5jnaElEkKjvbWteQsZAEYrgoS0q3uRr72Z7vaYFW9FyRxTrrIb1EVUew+CGW4DJhdbegOao9eZUdHfW8eU+o8IjkM5hljAnVdzXwx/5rQ0DcE0rKhIqaJpGQ4cMbG4gqS2NgpgmpW0u18WlckqIweEdUr4kzv0H+Trq9to7W7RcjS7JE68/oSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
Message-ID: <bcb86082-31d8-4c59-b731-9aca05742568@oracle.com>
Date: Tue, 21 Nov 2023 18:31:13 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
        "Zhu, Lingshan" <lingshan.zhu@intel.com>,
        "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
        "cohuck@redhat.com" <cohuck@redhat.com>,
        "sburla@marvell.com" <sburla@marvell.com>,
        Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
        Yishai Hadas <yishaih@nvidia.com>, eperezma <eperezma@redhat.com>,
        si-wei.liu@oracle.com
References: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYTVA=kOT5vZSZ7nwTm00vbMy92EUV9RMX5ycrhweeVQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEvYTVA=kOT5vZSZ7nwTm00vbMy92EUV9RMX5ycrhweeVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SJ0PR10MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8936c4-cee8-47c0-03a2-08dbeb0319f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LwQWvt1nvqS69emH6HyArmtYf/JbBh27LvQWZPpCat+ppScs3ZuuFYhb1tI3N72AS8NwE0Cqc8SipOtAjbmnQ89ht0PicupHnFyB1tdF2VPhc7/ru4knxUI83KrOy4DZvrz34PNPrbFLlHuyeuZl2+gyA6eOWwd8koR4o4i1SUqdBeaNqeKqQk+0e7iJYEcODqin41suHAxCsFEdu6qSAq/UiSOrFAvDWGLC4bAGaFtmcsTwpgScCpYIgD4yknkQxquFrJiaKq0KfKmg5yX9b3yw/kgwVpvYYvIBSZYERkjGqkD7RQdLIF3uaEUb6j5iV0DkKXUJlQ9j92EmfjItChW2p8f84XUkzTMfx0FLQapoEN5aEBSaP1AMdWKK5oqbL5xDKRDsbZzygGPIqBlqijW7xu1esbME9xNlyjMMAv91AZshmCjM4sEIB8wZrSDMg3RfcqYFlnL72f/TPZ6FxKyfCZ+aT9yvzcw7CnDEoujCJ0vp/N2Um0Qw6OxENFH5pmka08GPnxH00bU6+ugdXwJzXZ49B/SU+KA2xnz/l60Oa9tk+0URyQw7bLZqQi3hMdUprsgdTt4xTlhEkTpORnwIcuFF+O0LLZMqUgFn5GsdcyAB8X7dt6eFe3+KnoaR/yOl9t4B+IzvUDxRpSWTTYo35eoc5r4ZXMVLP3PydDrSTuDn/uO/a7btnaVjM5eWLJq4gqAC0Q4/NYHXvyU7YA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(316002)(66556008)(110136005)(107886003)(2616005)(26005)(41300700001)(478600001)(66476007)(66946007)(54906003)(6512007)(6506007)(6486002)(83380400001)(53546011)(31686004)(966005)(36916002)(6666004)(8676002)(8936002)(4326008)(66899024)(7416002)(2906002)(30864003)(5660300002)(38100700002)(36756003)(31696002)(86362001)(69594002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzFqZDJDTnJ2WU9MUHZzQVFadFd0TWJ2UERSOTd2ejhpSEM4WExqR1BFY2ND?=
 =?utf-8?B?bnp1cmhUYnkwQW5JUUVzVlppUldvMTJ1REJ4SzhYTGFrSWpIU2tQaThjSE5J?=
 =?utf-8?B?OEJOSU8zcG5KaVJscFVxZTlxYms1MFhpdnczWHRnNEplQnFNdjlDSzhtSFZP?=
 =?utf-8?B?VGJhc3lMQzBFcmZDVFVWUWpxem0ranZ1bGpKOHlVT1Z1a2ZGejhxSkpGS0sr?=
 =?utf-8?B?aEFWVGMwMU56Y3ZvSitaenJhaWtFQzExckVSemNJNFcvSnB4L2t1dEFQVFYz?=
 =?utf-8?B?SG94V3BkclZERWJNbnljVFRGTHdKQjgvYWFid3VTbEJrUXFQRDk3TzF3dTJH?=
 =?utf-8?B?VSt3dzJPTEhqMGRRT2NuVi9PRG10VHM1MXlBNFdTcEZVcWk5WjhIMHJSc09N?=
 =?utf-8?B?OHNiVUMxRWgwcmZrSjBkdEl5WFdjdDltb0cvd3E1V3VpaVRoVnhYUEpHK05w?=
 =?utf-8?B?bkxMNW1SS0pNSGt0MkNKOFQ1eU9UOWNmVDVodHB1dlo2ekJrdmpDOWZPdStt?=
 =?utf-8?B?WmxvOGlWZCtlaU83VXVQUlJJdVhtSEtmb2Qzdm5FTG5kVlllaWduM2xWd0xE?=
 =?utf-8?B?Q0JHdE15Z2RzWC9oRkgrMlFKRlpKY3IrSEl0aVpkclBWaE0vQjVnakRRMUhJ?=
 =?utf-8?B?eW9abkxZdmM5M2lMekpsbnV6QkQwVUI5Y3RqOVhuM1JGUXR2clU0bHUvNmdG?=
 =?utf-8?B?NEVTSTJvMWIxTGxSUGFySDZLNGpLKzNKaGs3a1ErN3V4MFJKc1pIQ012MW5W?=
 =?utf-8?B?T0FEYW9CSFZ5bkNqNUVjUWk3aTJwMmc4allCcHFXZysyeFZYekNTb3hjL1hP?=
 =?utf-8?B?L21SOTF1QUhDTHU2Vk1Qd25nNytrMkJ3a1VNVmJ2d3dleXo3cEdIbnA2ZnRr?=
 =?utf-8?B?bmhCenVsR1dqM2hJQU1DaTRNMWhIbEFSdHRFYXJycCszRVdRV1BNUTM2RFpr?=
 =?utf-8?B?WTdmREtkWmtIUUJrNGFISE50cW55bzVlU1VWNGFIdkpBQjh0NWpFMG4yR2Fn?=
 =?utf-8?B?a1FTSTFIWDlJZEczcmZ5Tzdyb0xVS1dOWm9FeHMrdXovVlA2VzFORnk2c3pR?=
 =?utf-8?B?ZUZXakMwNStOcldsdUd6R0lmUHlMRVRxOXVlZ051NkoyV2dzYWw2UEtCdFVs?=
 =?utf-8?B?Y1Z2MGI1SkJIaGtGSkhrbDNySWpNQkNqRFBITUZsZG51NTRiK0NPd1EwRnd0?=
 =?utf-8?B?ZXh2YkJQdC8rNXJtYVEzMlpyb1EwVjRMdnBrU1lTWWVxQ2NkRlY0QTFLK1BO?=
 =?utf-8?B?QkE1K2xiV2sva1Y4Ync2M00raXN0UXkvdHZWWjg4OWt3ZHUzN1JoeUNxbG9G?=
 =?utf-8?B?OWxRLzdoUHZDNU9sVFhCNzJCN3lvQmd1MmZhK2R1ZHB0MW9xY1BLWDU3aGlN?=
 =?utf-8?B?cDVsZmFGTDRwWmpkNlBaVmJJNjdYWWhKZUoyL2l2RVpYcnVhWG81cExMY0Yy?=
 =?utf-8?B?Y0ZwcnV3THVmdkJUczFTMlJUcTNXdDFDK0p3N3FYVGZNSTlBZStaSDdJazM5?=
 =?utf-8?B?RUJ0RDV2aGF3RzNiUTc0bnVueVV0aXFDTWs3bS9nK3B1QTNXQmQwemFWdzd6?=
 =?utf-8?B?bkF4ZHExMERWRTgyUFVjZmh5TFZDbE5mb3J4Q3k2Qk11cnJBL1pQRVdraXhu?=
 =?utf-8?B?cFFScE9Da1JuRmhQWVFuL2JVS3FxM3g0aHZsbGVVUUFsSitIaC94cFlqelVt?=
 =?utf-8?B?T1UwRnVZTGFTMklJT3JjeFlXQ3dJTDJub3UwN1YrZUhKRWZoZDFEaDN1blJp?=
 =?utf-8?B?U3VWTnZnakoweE1DY2NwVFVzU3JUUE5FZ0JCUU8vaDJvWi9PZXFDOUtJZGsx?=
 =?utf-8?B?WGcwTWU0UEM2ejdVMWNXanF2SnpSZEZIV1J4eWNmby9OM2hKSExqdE12Zk9k?=
 =?utf-8?B?TTdGY3ovTnczSkN6amprK1RoUkNwMi8wRVJrK1dqOUFtMG1jeW5lZzlyNkpI?=
 =?utf-8?B?QkN2ajFDdWpmR0wzM0o4eXpXTDVpbW1GdCtwN00vM0ZJOXQrTlptbjBjQzVG?=
 =?utf-8?B?MTBmKzRlSVRuRldhZ1Y0Wmg2dW9JSXVmcFU3TUkxK3ZGZnJKQ211V1Rtdmp3?=
 =?utf-8?B?bXJ1VlhINHYwM1NSclo5am0wZTEwNzA1V1hreWJhUXF4RFZ5c3hJMXVtQVd0?=
 =?utf-8?Q?GH/Y+VcOmjhlYVhJDBzeT7Skt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wZM7hGyzSoko1+0S59DI2RIDiUIxI4QRtRhoQzWe5Bvzqtbew+i3S8VhdNZaYZCL2m3gL6HK7kmNYhzdiO0vWkwOezy8oyijrCEtrdxdhYIX2EgX3fblqdsnOdWRF1ha9nXVFtOCRby+tNFImgxZOqrSCCKPtPoeLvlh7AMwk6GvWfa1y75cR4lhS/FXzVD3BJOTA6BA+jwf0AvIbsasB+Czkofelnji9uHWquNUXlE+LuvfE9rQDKY8KRNFrpimFBqdaaZE7wfEIbBSWuu4TiIeF05HjnxVsVFHdY6CuuZ7BDcA2rYJRyEWzoQ2U0nB6VVvhx4cNf0SNjFYhkIcWu3w6GGRTN/Mym91ACAfjTbkr4LGFInXi0hRS3M+K5pRDfiiQD++78mvJQvimjPBOe9jaznOtUhqQaZh4dPsHtCLvy3fpI6vWRv2k142I16ednv5MILuO2nE/Ah7ATjtSAvmvMa2EmmPCFQGXw8mqQFc+K2HubJqfGiMKoRbW+ThKcwVdi4estpoQqLNIvGHR8oef4OIJg8fODVETiQFDZrQ9FrNZ7f34TCiKGMWaSlZkTQkq6WGDF/WIuTm8NJZ2I3G7UxvhZ69Ck9kxIPgxcL7aepSbYikCLuUEClnmS1K1YdtSZauoyVP1/STFts9lFzL9Y9DLVgPcNAJAheuRJpVosmXgk4ZGhHj+54bRGd9WYidrqOks/acD+raPMgQNV/zBjWOaaY6yKPWGr02P+gzHY+1nLDEsm8xfVosgZw+O2wxiDdmLDlr2GbtsEvN69Xk/D556WXYx+CrxykzuG6Q96q3nP3c5fjwl3PxPemmzYPFJk2Ga0YId4SA105Ikklym5P58k7E6/QFxwU8WVTxG/EpPrEucgoKk0CiIgizu6Kg6qtLjXJxtk2bO2Zd3g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8936c4-cee8-47c0-03a2-08dbeb0319f2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 02:31:16.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2nUqKttrp/f2l0xM9QyzJcoTtde/oECFaTcWrBdShQpuJNVJJVCFrmtHDNXGb6EPSbjAVTD94uqoSv/8oj6GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5616
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_16,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311220015
X-Proofpoint-GUID: p5vf0mULSB0haU6u4g6Ecat9zn2HdWKm
X-Proofpoint-ORIG-GUID: p5vf0mULSB0haU6u4g6Ecat9zn2HdWKm
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

(dropping my personal email abandoned for upstream discussion for now, 
please try to copy my corporate email address for more timely response)

On 11/20/2023 10:55 PM, Jason Wang wrote:
> On Fri, Nov 17, 2023 at 10:48 PM Parav Pandit <parav@nvidia.com> wrote:
>>
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Friday, November 17, 2023 7:31 PM
>>> To: Parav Pandit <parav@nvidia.com>
>>>
>>> On Fri, Nov 17, 2023 at 01:03:03PM +0000, Parav Pandit wrote:
>>>>
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: Friday, November 17, 2023 6:02 PM
>>>>>
>>>>> On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrote:
>>>>>>
>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Sent: Friday, November 17, 2023 5:35 PM
>>>>>>> To: Parav Pandit <parav@nvidia.com>
>>>>>>>
>>>>>>> On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>> Sent: Friday, November 17, 2023 5:04 PM
>>>>>>>>>
>>>>>>>>> On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
>>>>>>>>>>
>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>>> Sent: Friday, November 17, 2023 4:30 PM
>>>>>>>>>>>
>>>>>>>>>>> On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>>> Sent: Friday, November 17, 2023 3:30 PM
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu,
>>>>>>>>>>>>>> Lingshan
>>>>> wrote:
>>>>>>>>>>>>>>> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav
>>>>>>>>>>>>>>>> Pandit
>>>>> wrote:
>>>>>>>>>>>>>>>>> We should expose a limit of the device in the
>>>>>>>>>>>>>>>>> proposed
>>>>>>>>>>>>> WRITE_RECORD_CAP_QUERY command, that how much
>>> range
>>>>>>>>>>>>> it can
>>>>>>>>> track.
>>>>>>>>>>>>>>>>> So that future provisioning framework can use it.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I will cover this in v5 early next week.
>>>>>>>>>>>>>>>> I do worry about how this can even work though.
>>>>>>>>>>>>>>>> If you want a generic device you do not get to
>>>>>>>>>>>>>>>> dictate how much memory VM
>>>>>>>>> has.
>>>>>>>>>>>>>>>> Aren't we talking bit per page? With 1TByte of
>>>>>>>>>>>>>>>> memory to track
>>>>>>>>>>>>>>>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> And you happily say "we'll address this in the future"
>>>>>>>>>>>>>>>> while at the same time fighting tooth and nail
>>>>>>>>>>>>>>>> against adding single bit status registers because
>>> scalability?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I have a feeling doing this completely
>>>>>>>>>>>>>>>> theoretical like this is
>>>>>>>>> problematic.
>>>>>>>>>>>>>>>> Maybe you have it all laid out neatly in your
>>>>>>>>>>>>>>>> head but I suspect not all of TC can picture it
>>>>>>>>>>>>>>>> clearly enough based just on spec
>>>>>>>>> text.
>>>>>>>>>>>>>>>> We do sometimes ask for POC implementation in
>>>>>>>>>>>>>>>> linux / qemu to demonstrate how things work
>>>>>>>>>>>>>>>> before merging
>>>>> code.
>>>>>>>>>>>>>>>> We skipped this for admin things so far but I
>>>>>>>>>>>>>>>> think it's a good idea to start doing it here.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> What makes me pause a bit before saying please
>>>>>>>>>>>>>>>> do a PoC is all the opposition that seems to
>>>>>>>>>>>>>>>> exist to even using admin commands in the 1st
>>>>>>>>>>>>>>>> place. I think once we finally stop arguing
>>>>>>>>>>>>>>>> about whether to use admin commands at all then
>>>>>>>>>>>>>>>> a PoC will be needed
>>>>>>>>>>> before merging.
>>>>>>>>>>>>>>> We have POR productions that implemented the
>>>>>>>>>>>>>>> approach in my
>>>>>>>>> series.
>>>>>>>>>>>>>>> They are multiple generations of productions in
>>>>>>>>>>>>>>> market and running in customers data centers for years.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Back to 2019 when we start working on vDPA, we
>>>>>>>>>>>>>>> have sent some samples of production(e.g.,
>>>>>>>>>>>>>>> Cascade
>>>>>>>>>>>>>>> Glacier) and the datasheet, you can find live
>>>>>>>>>>>>>>> migration facilities there, includes suspend, vq
>>>>>>>>>>>>>>> state and other
>>>>> features.
>>>>>>>>>>>>>>> And there is an reference in DPDK live migration,
>>>>>>>>>>>>>>> I have provided this page
>>>>>>>>>>>>>>> before:
>>>>>>>>>>>>>>> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.ht
>>>>>>>>>>>>>>> ml, it has been working for long long time.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> So if we let the facts speak, if we want to see
>>>>>>>>>>>>>>> if the proposal is proven to work, I would
>>>>>>>>>>>>>>> say: They are POR for years, customers already
>>>>>>>>>>>>>>> deployed them for
>>>>>>>>> years.
>>>>>>>>>>>>>> And I guess what you are trying to say is that
>>>>>>>>>>>>>> this patchset we are reviewing here should be help
>>>>>>>>>>>>>> to the same standard and there should be a PoC? Sounds
>>> reasonable.
>>>>>>>>>>>>> Yes and the in-marketing productions are POR, the
>>>>>>>>>>>>> series just improves the design, for example, our
>>>>>>>>>>>>> series also use registers to track vq state, but
>>>>>>>>>>>>> improvements than CG or BSC. So I think they are
>>>>>>>>>>>>> proven
>>>>>>>>>>> to work.
>>>>>>>>>>>> If you prefer to go the route of POR and production
>>>>>>>>>>>> and proven documents
>>>>>>>>>>> etc, there is ton of it of multiple types of products I
>>>>>>>>>>> can dump here with open- source code and documentation and
>>> more.
>>>>>>>>>>>> Let me know what you would like to see.
>>>>>>>>>>>>
>>>>>>>>>>>> Michael has requested some performance comparisons,
>>>>>>>>>>>> not all are ready to
>>>>>>>>>>> share yet.
>>>>>>>>>>>> Some are present that I will share in coming weeks.
>>>>>>>>>>>>
>>>>>>>>>>>> And all the vdpa dpdk you published does not have
>>>>>>>>>>>> basic CVQ support when I
>>>>>>>>>>> last looked at it.
>>>>>>>>>>>> Do you know when was it added?
>>>>>>>>>>> It's good enough for PoC I think, CVQ or not.
>>>>>>>>>>> The problem with CVQ generally, is that VDPA wants to
>>>>>>>>>>> shadow CVQ it at all times because it wants to decode
>>>>>>>>>>> and cache the content. But this problem has nothing to
>>>>>>>>>>> do with dirty tracking even though it also
>>>>>>>>> mentions "shadow":
>>>>>>>>>>> if device can report it's state then there's no need to shadow
>>> CVQ.
>>>>>>>>>> For the performance numbers with the pre-copy and device
>>>>>>>>>> context of
>>>>>>>>> patches posted 1 to 5, the downtime reduction of the VM is
>>>>>>>>> 3.71x with active traffic on 8 RQs at 100Gbps port speed.
>>>>>>>>>
>>>>>>>>> Sounds good can you please post a bit more detail?
>>>>>>>>> which configs are you comparing what was the result on each of
>>> them.
>>>>>>>> Common config: 8+8 tx and rx queues.
>>>>>>>> Port speed: 100Gbps
>>>>>>>> QEMU 8.1
>>>>>>>> Libvirt 7.0
>>>>>>>> GVM: Centos 7.4
>>>>>>>> Device: virtio VF hardware device
>>>>>>>>
>>>>>>>> Config_1: virtio suspend/resume similar to what Lingshan has,
>>>>>>>> largely vdpa stack
>>>>>>>> Config_2: Device context method of admin commands
>>>>>>> OK that sounds good. The weird thing here is that you measure
>>> "downtime".
>>>>>>> What exactly do you mean here?
>>>>>>> I am guessing it's the time to retrieve on source and re-program
>>>>>>> device state on destination? And this is 3.71x out of how long?
>>>>>> Yes. Downtime is the time during which the VM is not responding or
>>>>>> receiving
>>>>> packets, which involves reprogramming the device.
>>>>>> 3.71x is relative time for this discussion.
>>>>> Oh interesting. So VM state movement including reprogramming the CPU
>>>>> is dominated by reprogramming this single NIC, by a factor of almost 4?
>>>> Yes.
>>> Could you post some numbers too then?  I want to know whether that would
>>> imply that VM boot is slowed down significantly too. If yes that's another
>>> motivation for pci transport 2.0.
>> It was 1.8 sec down to 480msec.
> Well, there's work ongoing to reduce the downtime of the shadow virtqueue.
>
> Eugenio or Si-wei may share an exact number, but it should be several
> hundreds of ms.
That was mostly for device teardown time at the the source but there's 
also setup cost at the destination that needs to be counted.
Several hundred of milliseconds would be the ultimate goal I would say 
(right now the numbers from Parav more or less reflects the status quo 
but there's ongoing work to make it further down), and I don't doubt 
several hundreds of ms is possible. But to be fair, on the other hand, 
shadow vq on real vdpa hardware device would need a lot of dedicated 
optimization work across all layers (including hardware or firmware) all 
over the places to achieve what a simple suspend-resume (save/load) 
interface can easily do with VFIO migration.

> But it seems the shadow virtqueue itself is not the major factor but
> the time spent on programming vendor specific mappings for example.
Yep. The slowness on mapping part is mostly due to the artifact of 
software-based implementation. IMHO for live migration p.o.v it's better 
to not involve any mapping operation in the down time path at all.

-Siwei
>
> Thanks
>
>> The time didn't come from pci side or boot side.
>>
>> For pci side of things you would want to compare the pci vs non pci device based VM boot time.
>>
>
> This publicly archived list offers a means to provide input to the
>
> OASIS Virtual I/O Device (VIRTIO) TC.
>
>
>
> In order to verify user consent to the Feedback License terms and
>
> to minimize spam in the list archive, subscription is required
>
> before posting.
>
>
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>
> List help: virtio-comment-help@lists.oasis-open.org
>
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>
> Committee: https://www.oasis-open.org/committees/virtio/
>
> Join OASIS: https://www.oasis-open.org/join/
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

