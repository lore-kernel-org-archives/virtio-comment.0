Return-Path: <virtio-comment-return-8571-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F26DC61DF7
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 13:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8B0D32AC53
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 13:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51AFD9868B1
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 13:20:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2A3029868A2; Thu, 23 Nov 2023 13:20:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DF439868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 13:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alMhaR3mY/s/HjqhNHqFJzNPcpUHmhza9p8Hfps+N9WPkrmxbKlwKmc3V606ln+MZkxlfmZsc+UxOHrgw9ceaevGls603iPTUQ6PVQozBcSgWajcV42bHNQXSS+fAbnQJ84TU5ptN2WNYbQ/K547fVtTLg6YoFtqNE6O6se9V/hiKb1+SIcpftntypfzsnnM7Fg+5+K3JqMef6K0PlxEEBzGZTbO6BRqu5nSpg3xbrLJM4DOptJ36KKllEJadGb3G3ZBupZI5is77shLjXm78K/G25ljqKUSB782ZZKMww4F4CFwjK/i66bUGO2oDXIlbpxEE25t5XZXBFr0H/QmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uHFq9iQlN9vsiqmnkLlkTFgTpV9YVnrDkCqUj9GejI=;
 b=EJ8XYAfFWfVNKD2gGFRLXLRe6Wwc6ts4K6G8t/YuKqhgkXAxVVyruZF9c8jF1nQTtFDC13YgnmmevNvwNgm+RgK7HYqAugGj2Fb9i+wQW6FCI1yz+LxZexkHCqVfdRUxFpzEML8XbMM3zaSNGXaO2iDXT0lUE54p/6DD+LdE+RtHWfhrokq4oOViSi/eo2pbstY8aKlx06JCRtoaKzB2QQWmJFXIGa9TcD71FeAiOh6djTgKIoZ9SkNnWxgebHVPJgptSZfy78XwbSGoCk+MaIPqF0SwQaK0vxJVFQyUUnrpkG5NoaVAA/wEF0j91fj/1Ol/BXJNBwxJ9bySIJyPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
Message-ID: <9404c15c-9c9b-45c7-befd-636b3d831c3e@oracle.com>
Date: Thu, 23 Nov 2023 05:19:06 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
        "Zhu, Lingshan" <lingshan.zhu@intel.com>,
        "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
        "cohuck@redhat.com" <cohuck@redhat.com>,
        "sburla@marvell.com" <sburla@marvell.com>,
        Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
        Yishai Hadas <yishaih@nvidia.com>, eperezma <eperezma@redhat.com>
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
 <bcb86082-31d8-4c59-b731-9aca05742568@oracle.com>
 <CACGkMEuOV7fSN8hXRG6HOvfOBZYrr_ZvRE0eEJwCxeHzLHebYQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEuOV7fSN8hXRG6HOvfOBZYrr_ZvRE0eEJwCxeHzLHebYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:510:5::24) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SN4PR10MB5576:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b200d5f-fd65-4bd2-1a97-08dbec26c7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+4cGyGcPqEQ6H7bXdcmNj7HWX5HSLRDz1iMCwcj3CoDDRosM0AXjLc9SQhwMv5WrHwqLxCk+4ZmUiCe0XORGzKciAs32n0A1l0vHobHdYOJxXEHNlY39mQnnJOfddhQrgwv6QqxjLfhIh2rq6Q3R0qPmLnjKuCNP5Lnj3VQbkG6+csSLFTu38rg3JTShjyMl11f5P2QfZLe8GE1jDqMfm7wLzhNV4HwK0+XalShKrYB0hnNauYpVSbs2kTSVmlCdHxnUo44KgjcmHw562QUAzyyM1CRSMQmOxKXQQOyQHmKpvTXvIwZM019vkPWRBtRsNZuXV2NKEDXscyssukuVt13wl9gJv5z73WdaVRh3JQb8GSLHkPahh87B2I5YEcR0q+lRBCnkBhhnC02uvswICZ7NjtzLv/Da9Rv0Dpf2ZJBjzYX2OqmwXwNBGEFEm/ah8C11F1O1wimwPqGVLqptHrZcQJPbgLMB6agcPjlKGzx499txt4euoepQt4z9XWkVUz5KJKfDS8/nCZ2Jb4AckZWrj9fgmOEFiQF3iUo9CWU9fT1ESx78WvwUo+l2eyU7RJpvJYS8gBcAdVc2WhoerJbFBfMVMDlDvOKVUpJ90213CMonN+8I5n7CV+GCw4N0Ywuy/lkHf3LWVwPuGQhyXZs7fgj8gVYos/LVIu2tLhQ3dxfl0svveB+G2AI7cqKgNjye1dozrWjMLb4+Kj7Zgfm+PFLrKU2PncZZKVE4oYrPVYXKPQBdDPASbEf5Ewzj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66899024)(31686004)(26005)(66946007)(66476007)(54906003)(36756003)(38100700002)(86362001)(31696002)(66556008)(316002)(36916002)(6512007)(6506007)(53546011)(6666004)(83380400001)(2616005)(966005)(30864003)(7416002)(2906002)(6916009)(6486002)(4326008)(8676002)(478600001)(8936002)(41300700001)(5660300002)(69594002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1JVb2NpUnZmU3RHL0Q3RU9MSnp4SkpHeWRxZ2xtK2ZEaXJubmE1QkRjRVBo?=
 =?utf-8?B?dUgwdEZOV3B3WjMrd1ZpWXJidHNsQ1YzRmtwbS9lWEtEc25wRFEwN3N1eWZw?=
 =?utf-8?B?ekpscHpDNG0vS2hOaDduV0NoQjhja1BEZXJ2ZlkxMld0WGxKQWloQ2xtaDRr?=
 =?utf-8?B?cVlSSmVkc2RObDhKRDdZQXhSZ0dGRWMwTkpjQkpzMHNjSWU3M0U3cTgrRTlh?=
 =?utf-8?B?blR6NnhGSzh2NVR5YzZUbnQzbmgybXZtNlhwZWhGWjA4OEIxazA2WHVtMUlp?=
 =?utf-8?B?TzNvQTkvanNnenpVOVA3dzNKck5CcE81cndkNitSUGhpWHp3TnBNUHlpcmdD?=
 =?utf-8?B?ZG1aTWJqaFNzVytqMlFsNmdLMjFhM1N6YXA0S214Wk02TUZ1U0d1M1lYaFo2?=
 =?utf-8?B?T2hBTVRQc2RNS2FKY0F4cDVvL3MwanZxcXBYVStmcjFLQXUrRlF1RERxcmM3?=
 =?utf-8?B?RzV3QmJEaXZtMVdJbnl2UVUzVUhrUVUxMng0NkFiWEllak9VZDU1T0M1VVRw?=
 =?utf-8?B?bHJtRjkzWmFCN3BONjl6VlYzTzA3NThnWEdVZVpnamRVeHMyb1RKWTFhUGJR?=
 =?utf-8?B?RlgyZUZqMnZNMjFuZXYrcFVCT3p3b3BWbDNtR1BBenlsU0ZBYjlDc05UWXFR?=
 =?utf-8?B?ZlFJS3ZZcHB2U1RmMmJyQTNFZFZUVFM0NjVLcHNvcXh0cnRRQTlxU3paZTRT?=
 =?utf-8?B?UFNUTndDOTZ1KzFlWXNNazgweTBQeC9KNTVoN2cxbjk3K2JUUC9mdlBqWGMx?=
 =?utf-8?B?azF3czg3WktERzlzVGo5RmVsdENYaUlNWVhkN1dzN2twR1F5WElDaFhGb0E3?=
 =?utf-8?B?OFZweEM5eDE3d215VURUOXI5SFN3L0dJOTllWDk2SlBtQ2hTbzFkZCtIRGE2?=
 =?utf-8?B?SnF4RmZNRWpLNlhJMnc0RWIvQkpHcGdNR05zYS83bnFUbUdEcFZwK2J2U0dI?=
 =?utf-8?B?ckJ4ZVZab0c0WWdMY0NPNWRCbUlDT2lDL1ZXM0hjVkxJeGVTdUtLd0tycDNk?=
 =?utf-8?B?Q1hpRkFERzdWaEtPSzZXMysyNW9Wek5hdXQwRFQ0RnY2Rjhtckk3N2U5dUJX?=
 =?utf-8?B?dDRuWDdkeDY1T0pBbFQyR0NzTlMwVWZWLzBiZmZqVS94NnMvcWJDNm5OTGVs?=
 =?utf-8?B?MExkWTdaTTZwY2hjSzF0eXh6TGJvWmQ4amN2TW10dmlmSklXbFJSY0dJODJ4?=
 =?utf-8?B?RjAxd2FUYjBQV1gzWXhRNTZQUEo1NUd3YndmblBGejRoRzNvcHRqQWducjZq?=
 =?utf-8?B?d3hzeHVtOVREYnk0Qm9aWHQ5bVZLRVFMRzU5elNQbm4rTUxtcTJDNGp3dzhF?=
 =?utf-8?B?ZWF2NGt0dFdhVm8xWGRoKzh6eTQwL0N5ZnBOTGNjUy9KYUU2bGtTeWkwaDJX?=
 =?utf-8?B?ZzlneW1TYTF5QUlxMGtxQnNmNjl3ZUdCZmVRTHJRTzl0c3p5SFRiYTJzMFdj?=
 =?utf-8?B?bzZZaVJnOEl5NGJYMlVxbk9uVEZsWGJHU3lwcEdpSmxVZ3dRclZpWFJMNXU4?=
 =?utf-8?B?eWJWY2FmdG5HRHRTZm1HSS83RzdZcUR2WCtrQUVjajEyUG90UkRRMUN3ZWlC?=
 =?utf-8?B?K2FFZHc4WFZVMm40U3NKWDZPNUo2bkxqWkNqQmJ4SFdJSXdzN09tcXZtUVQr?=
 =?utf-8?B?V1BaV0VpbHZ3bE1aRUw3SmRKU0JLNEdzbVBhR1haNlpVdzJsdnhnSm9oYW1y?=
 =?utf-8?B?TVp1ejdQODROUkE2eFBqeS9qUENJU1NKcHZpNWZLcjNla2ZFTFhiM3c2R3hL?=
 =?utf-8?B?RjRZK3dLUGtqZnl1NHJXWGt1NGk1ZSsrSHU3T0lhOVU5VHU3V2ZhUUVmc0Z5?=
 =?utf-8?B?bVZWTjdVOXBFMFFaZVErbmQxZGMvMEFERURvaUN6UkQrekl2NlUrbDVZMUlv?=
 =?utf-8?B?bU1pem1EcmRNY241a29pUi9DYWtwWnRYRkcvazJZcmh5MG1vQ1pkdEtJYmxS?=
 =?utf-8?B?RDRQcGJlTUFJTmtVKzFZd05iOUs0a3lBV3p1TWdQNVkxM1hkL2FOVmZEMExw?=
 =?utf-8?B?S3ArZHNsbnZpc3UrcytGMHZZa1lmcllkdnhjaGYzR3AreEF4aytjUlV3SUNE?=
 =?utf-8?B?UkUxdWZ3ZVJ4eWpWOTYxSmkrSGhmbHlpZWJ2L2R5VGxQeUZ1ZjJsSDFsZ0RP?=
 =?utf-8?Q?LhciY6KR+t10GxcaNzBJZ1qni?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QMSvYvOwkpEVLdIvYBXgKSoTBFPE5w9dUD5BqB2BoObahgJKe8VffYisPzjdOwaZ3zVnbIX8wMyGmj8hHJ4byrreMjgDs+gb5qKZn0MgBL6TXgXl0gJwMeOH+q4qbc056h0IGIjeA4b1OKcdBBmixTT3YH3a8HlQ4SC7iO52HU/sLDutswOJDCaU15CPT53KCuPIx/AhEat9Dv+wjYxZjzURuxXIV36DUd2BPn5DySUz+HHZK1k6BIYfcwSUBX0w/YiXxcfx/8rvx32DKrpifkgZ2Gr5pd0Vpvw2Jq8SO6QwQM4W03I3LWlfvMEH6ToX3BDyuFWCfUdEhwXum1zPrFrLRG8eDlQmX7cuZBlsSQb0buWSJfVnAl9pCUDC+B+uAAUFlwaK2cPJYeIl7dJkbj9GpGaOu+dSFjH5lNFRsG7+CFGwSoGMFYKnA2bBC6FR9SbW9UwlfyUT5FZ1Mp7hrjpGgbrcI774XrzQeUs8y7o+OwIc9hxJ7WXldWWk1oQKs8cLVbsSZ4ghcPNa5JngrQX3spQwtW61bookT3KuWeiq0ah+Z8DXDGNDsry47xdSDzkamuSWY1pXgvh8Z8L8QrDG1/UTMA+o4abHkZIyjd7NTLx1HwkdXj4K2QdViPdyYIWXpSmTVAYu6SiQPlqqD8sZljxkwPgy07/GA+BdIkljnS7diVJ2KaW2bp4S7BY6hd6l/O6vzRGYQdn0/6aP1iAz46mk92bfReAjUahqGRuKuWM43A9TvnS8kWBV/M6D1Af1UenZRE5MZy2ygX87CHgiVAWAnEb6DXci4aTEVLxXV/Uh6MsasOgDlCoqnwbKdnfwhU7R32+FXoi3M3dybbv7Cs1OyVxtyL98Lbok1tMmNhIWL1J99gf3j4GwrvgVsPIatO8XwmJDq7v6my/+bg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b200d5f-fd65-4bd2-1a97-08dbec26c7f8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 13:19:11.7186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63SZytMxDTLOquOzC2Ve3KKvWWkvbYvho/1JmihkLooxApAOZLkE0N2sSrmrzdNjkrXBFxN8GPjfgGi2+RF+pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5576
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_11,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311230095
X-Proofpoint-ORIG-GUID: keoAO9NRPrwmBjawJlLsNLTHK-TulWzB
X-Proofpoint-GUID: keoAO9NRPrwmBjawJlLsNLTHK-TulWzB
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



On 11/21/2023 9:31 PM, Jason Wang wrote:
> On Wed, Nov 22, 2023 at 10:31 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>> (dropping my personal email abandoned for upstream discussion for now,
>> please try to copy my corporate email address for more timely response)
>>
>> On 11/20/2023 10:55 PM, Jason Wang wrote:
>>> On Fri, Nov 17, 2023 at 10:48 PM Parav Pandit <parav@nvidia.com> wrote:
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: Friday, November 17, 2023 7:31 PM
>>>>> To: Parav Pandit <parav@nvidia.com>
>>>>>
>>>>> On Fri, Nov 17, 2023 at 01:03:03PM +0000, Parav Pandit wrote:
>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Sent: Friday, November 17, 2023 6:02 PM
>>>>>>>
>>>>>>> On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrote:
>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>> Sent: Friday, November 17, 2023 5:35 PM
>>>>>>>>> To: Parav Pandit <parav@nvidia.com>
>>>>>>>>>
>>>>>>>>> On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>>> Sent: Friday, November 17, 2023 5:04 PM
>>>>>>>>>>>
>>>>>>>>>>> On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
>>>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>>>>> Sent: Friday, November 17, 2023 4:30 PM
>>>>>>>>>>>>>
>>>>>>>>>>>>> On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
>>>>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>>>>> Sent: Friday, November 17, 2023 3:30 PM
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu,
>>>>>>>>>>>>>>>> Lingshan
>>>>>>> wrote:
>>>>>>>>>>>>>>>>> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav
>>>>>>>>>>>>>>>>>> Pandit
>>>>>>> wrote:
>>>>>>>>>>>>>>>>>>> We should expose a limit of the device in the
>>>>>>>>>>>>>>>>>>> proposed
>>>>>>>>>>>>>>> WRITE_RECORD_CAP_QUERY command, that how much
>>>>> range
>>>>>>>>>>>>>>> it can
>>>>>>>>>>> track.
>>>>>>>>>>>>>>>>>>> So that future provisioning framework can use it.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> I will cover this in v5 early next week.
>>>>>>>>>>>>>>>>>> I do worry about how this can even work though.
>>>>>>>>>>>>>>>>>> If you want a generic device you do not get to
>>>>>>>>>>>>>>>>>> dictate how much memory VM
>>>>>>>>>>> has.
>>>>>>>>>>>>>>>>>> Aren't we talking bit per page? With 1TByte of
>>>>>>>>>>>>>>>>>> memory to track
>>>>>>>>>>>>>>>>>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> And you happily say "we'll address this in the future"
>>>>>>>>>>>>>>>>>> while at the same time fighting tooth and nail
>>>>>>>>>>>>>>>>>> against adding single bit status registers because
>>>>> scalability?
>>>>>>>>>>>>>>>>>> I have a feeling doing this completely
>>>>>>>>>>>>>>>>>> theoretical like this is
>>>>>>>>>>> problematic.
>>>>>>>>>>>>>>>>>> Maybe you have it all laid out neatly in your
>>>>>>>>>>>>>>>>>> head but I suspect not all of TC can picture it
>>>>>>>>>>>>>>>>>> clearly enough based just on spec
>>>>>>>>>>> text.
>>>>>>>>>>>>>>>>>> We do sometimes ask for POC implementation in
>>>>>>>>>>>>>>>>>> linux / qemu to demonstrate how things work
>>>>>>>>>>>>>>>>>> before merging
>>>>>>> code.
>>>>>>>>>>>>>>>>>> We skipped this for admin things so far but I
>>>>>>>>>>>>>>>>>> think it's a good idea to start doing it here.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> What makes me pause a bit before saying please
>>>>>>>>>>>>>>>>>> do a PoC is all the opposition that seems to
>>>>>>>>>>>>>>>>>> exist to even using admin commands in the 1st
>>>>>>>>>>>>>>>>>> place. I think once we finally stop arguing
>>>>>>>>>>>>>>>>>> about whether to use admin commands at all then
>>>>>>>>>>>>>>>>>> a PoC will be needed
>>>>>>>>>>>>> before merging.
>>>>>>>>>>>>>>>>> We have POR productions that implemented the
>>>>>>>>>>>>>>>>> approach in my
>>>>>>>>>>> series.
>>>>>>>>>>>>>>>>> They are multiple generations of productions in
>>>>>>>>>>>>>>>>> market and running in customers data centers for years.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Back to 2019 when we start working on vDPA, we
>>>>>>>>>>>>>>>>> have sent some samples of production(e.g.,
>>>>>>>>>>>>>>>>> Cascade
>>>>>>>>>>>>>>>>> Glacier) and the datasheet, you can find live
>>>>>>>>>>>>>>>>> migration facilities there, includes suspend, vq
>>>>>>>>>>>>>>>>> state and other
>>>>>>> features.
>>>>>>>>>>>>>>>>> And there is an reference in DPDK live migration,
>>>>>>>>>>>>>>>>> I have provided this page
>>>>>>>>>>>>>>>>> before:
>>>>>>>>>>>>>>>>> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.ht
>>>>>>>>>>>>>>>>> ml, it has been working for long long time.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> So if we let the facts speak, if we want to see
>>>>>>>>>>>>>>>>> if the proposal is proven to work, I would
>>>>>>>>>>>>>>>>> say: They are POR for years, customers already
>>>>>>>>>>>>>>>>> deployed them for
>>>>>>>>>>> years.
>>>>>>>>>>>>>>>> And I guess what you are trying to say is that
>>>>>>>>>>>>>>>> this patchset we are reviewing here should be help
>>>>>>>>>>>>>>>> to the same standard and there should be a PoC? Sounds
>>>>> reasonable.
>>>>>>>>>>>>>>> Yes and the in-marketing productions are POR, the
>>>>>>>>>>>>>>> series just improves the design, for example, our
>>>>>>>>>>>>>>> series also use registers to track vq state, but
>>>>>>>>>>>>>>> improvements than CG or BSC. So I think they are
>>>>>>>>>>>>>>> proven
>>>>>>>>>>>>> to work.
>>>>>>>>>>>>>> If you prefer to go the route of POR and production
>>>>>>>>>>>>>> and proven documents
>>>>>>>>>>>>> etc, there is ton of it of multiple types of products I
>>>>>>>>>>>>> can dump here with open- source code and documentation and
>>>>> more.
>>>>>>>>>>>>>> Let me know what you would like to see.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Michael has requested some performance comparisons,
>>>>>>>>>>>>>> not all are ready to
>>>>>>>>>>>>> share yet.
>>>>>>>>>>>>>> Some are present that I will share in coming weeks.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> And all the vdpa dpdk you published does not have
>>>>>>>>>>>>>> basic CVQ support when I
>>>>>>>>>>>>> last looked at it.
>>>>>>>>>>>>>> Do you know when was it added?
>>>>>>>>>>>>> It's good enough for PoC I think, CVQ or not.
>>>>>>>>>>>>> The problem with CVQ generally, is that VDPA wants to
>>>>>>>>>>>>> shadow CVQ it at all times because it wants to decode
>>>>>>>>>>>>> and cache the content. But this problem has nothing to
>>>>>>>>>>>>> do with dirty tracking even though it also
>>>>>>>>>>> mentions "shadow":
>>>>>>>>>>>>> if device can report it's state then there's no need to shadow
>>>>> CVQ.
>>>>>>>>>>>> For the performance numbers with the pre-copy and device
>>>>>>>>>>>> context of
>>>>>>>>>>> patches posted 1 to 5, the downtime reduction of the VM is
>>>>>>>>>>> 3.71x with active traffic on 8 RQs at 100Gbps port speed.
>>>>>>>>>>>
>>>>>>>>>>> Sounds good can you please post a bit more detail?
>>>>>>>>>>> which configs are you comparing what was the result on each of
>>>>> them.
>>>>>>>>>> Common config: 8+8 tx and rx queues.
>>>>>>>>>> Port speed: 100Gbps
>>>>>>>>>> QEMU 8.1
>>>>>>>>>> Libvirt 7.0
>>>>>>>>>> GVM: Centos 7.4
>>>>>>>>>> Device: virtio VF hardware device
>>>>>>>>>>
>>>>>>>>>> Config_1: virtio suspend/resume similar to what Lingshan has,
>>>>>>>>>> largely vdpa stack
>>>>>>>>>> Config_2: Device context method of admin commands
>>>>>>>>> OK that sounds good. The weird thing here is that you measure
>>>>> "downtime".
>>>>>>>>> What exactly do you mean here?
>>>>>>>>> I am guessing it's the time to retrieve on source and re-program
>>>>>>>>> device state on destination? And this is 3.71x out of how long?
>>>>>>>> Yes. Downtime is the time during which the VM is not responding or
>>>>>>>> receiving
>>>>>>> packets, which involves reprogramming the device.
>>>>>>>> 3.71x is relative time for this discussion.
>>>>>>> Oh interesting. So VM state movement including reprogramming the CPU
>>>>>>> is dominated by reprogramming this single NIC, by a factor of almost 4?
>>>>>> Yes.
>>>>> Could you post some numbers too then?  I want to know whether that would
>>>>> imply that VM boot is slowed down significantly too. If yes that's another
>>>>> motivation for pci transport 2.0.
>>>> It was 1.8 sec down to 480msec.
>>> Well, there's work ongoing to reduce the downtime of the shadow virtqueue.
>>>
>>> Eugenio or Si-wei may share an exact number, but it should be several
>>> hundreds of ms.
>> That was mostly for device teardown time at the the source but there's
>> also setup cost at the destination that needs to be counted.
>> Several hundred of milliseconds would be the ultimate goal I would say
>> (right now the numbers from Parav more or less reflects the status quo
>> but there's ongoing work to make it further down), and I don't doubt
>> several hundreds of ms is possible. But to be fair, on the other hand,
>> shadow vq on real vdpa hardware device would need a lot of dedicated
>> optimization work across all layers (including hardware or firmware) all
>> over the places to achieve what a simple suspend-resume (save/load)
>> interface can easily do with VFIO migration.
> That's fine. Just to clairfy, shadow virtqueue here doesn't mean it
> can't save/load. We want to see how it is useful for dirty page
> tracking since tracking dirty pages by device itself seems problematic
> at least from my point of view.
TBH I don't see how this comparison can help prove the problematic part 
of device dirty tracking, or if it has anything to do with. In many 
cases vDPA and hardware virtio are for different deployment scenarios 
with varied target users, I don't see how vDPA can completely substitute 
hardware virtio for many reasons regardless shadow virtqueue wins or not.

If anything relevant I would more like to see performance comparison 
with platform dirty tracking via IOMMUFD, but that's perhaps too early 
stage at this point to conclude anything given there's very limited 
availability (in terms of supporting software, I know some supporting 
hardware has been around for a few years) and none of the potential 
software optimizations is in place at this point to make a fair 
comparison for. Granted device assisted tracking has its own set of 
limitations e.g. loose coupling or integration with platform features, 
lack of nested and PASID support et al. However, state of the art for 
platform dirty tracking is not perfect either, far off being highly 
optimized for all types of workload or scenarios. At least to me the 
cost of page table walk to scan all PTEs across all levels is not easily 
negligible - given no PML equivalent here, are we sure the whole range 
scan can be as efficient and scalable as memory size / # of PTEs grows? 
How large it may impact the downtime with this rudimentary dirty scan? 
No data point was given thus far. If chances are that there could be 
major improvement from device tracking for those general use cases to 
supplement what platform cannot achieve efficiently enough, it's not too 
good to kill off the possibility entirely at this early stage. Maybe a 
PoC or some comparative performance data can help prove the theory?

On the other hand, the device assisted tracking has at least one 
advantage that platform cannot simply offer - throttle down device for 
convergence, inherently or explicitly whenever needed. I think earlier 
Micheal suggested something to make the core data structure used for 
logging more efficient and compact, working like PML but using a queue 
or an array, and the entry of which may contain a list of discrete pages 
or contiguous PFN ranges. On top of this one may add parallelism to 
distribute load to multiple queues, or add zero copy to speed up dirty 
sync to userspace - things virtio queues are pretty good at doing. After 
all, nothing can be perfect to begin with, and every complex feature 
would need substantial time to improve and evolve. It does so for shadow 
virtqueue from where it gets started to where it is now, even so there's 
still a lot of optimization work not done yet. There must be head room 
here for device page tracking or platform tracking, too.

Regards,
-Siwei


>
> Shadow virtqueue can be used with a save/load model for device state
> recovery for sure.
>
>>> But it seems the shadow virtqueue itself is not the major factor but
>>> the time spent on programming vendor specific mappings for example.
>> Yep. The slowness on mapping part is mostly due to the artifact of
>> software-based implementation. IMHO for live migration p.o.v it's better
>> to not involve any mapping operation in the down time path at all.
> Yes.
>
> Thanks
>
>> -Siwei
>>> Thanks
>>>
>>>> The time didn't come from pci side or boot side.
>>>>
>>>> For pci side of things you would want to compare the pci vs non pci device based VM boot time.
>>>>
>>> This publicly archived list offers a means to provide input to the
>>>
>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>
>>>
>>>
>>> In order to verify user consent to the Feedback License terms and
>>>
>>> to minimize spam in the list archive, subscription is required
>>>
>>> before posting.
>>>
>>>
>>>
>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>
>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>
>>> List help: virtio-comment-help@lists.oasis-open.org
>>>
>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>
>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>
>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>
>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>
>>> Join OASIS: https://www.oasis-open.org/join/
>>>
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
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

